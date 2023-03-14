import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:get/get.dart';

import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

enum _ShortenSubject {
  literatureAndMedia,
  // ignore: constant_identifier_names
  IOTSoftwareDesign
}

extension _ShortenObjectExtenstion on _ShortenSubject {
  String get raw {
    switch (this) {
      case _ShortenSubject.literatureAndMedia:
        return "문학과 매체";
      case _ShortenSubject.IOTSoftwareDesign:
        return " * IoT 응용소프트웨어 기획";
    }
  }

  String get shorten {
    switch (this) {
      case _ShortenSubject.literatureAndMedia:
        return "문학";
      case _ShortenSubject.IOTSoftwareDesign:
        return "사물";
    }
  }
}

class SchedulePageController extends GetxController with GetSingleTickerProviderStateMixin {
  var myGrade = 0.obs;
  var myClass = 0.obs;
  var titleIndex = 0.obs;
  var term = 1.obs;
  var monthIndex = DateTime.now().month.obs;
  var weekDay = ["월", "화", "수", "목", "금"];
  var timetable = [].obs;
  var currentSubject = 0.obs;

  var dataLoaded = false.obs;
  var isDataEmpty = true.obs;

  final DimigoinAccount _dimigoinAccount = DimigoinAccount();
  final DimigoinTimetable _dimigoinTimetable = DimigoinTimetable();

  CustomTabBarController tabController = CustomTabBarController();
  PageController pageController = PageController(initialPage: 0);
  late PageController calendarController;

  increaseMonth() {
    if (monthIndex.value == 12) {
      return null;
    }

    monthIndex.value = (monthIndex.value + 1) % 12;
    if (monthIndex.value == 0) {
      monthIndex.value = 12;
    }

    calendarController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut
    );
  }

  decreaseMonth() {
    if (monthIndex.value == 1) {
      return null;
    }

    monthIndex.value = (monthIndex.value - 1) % 12;
    calendarController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut
    );
  }

  changeTitleIndex(int index) {
    titleIndex.value = index;
  }

  _getGradeClass() async {
    await _dimigoinAccount.fetchAccountData();
    var user = _dimigoinAccount.currentUser.toJson();

    myGrade.value = user["grade"];
    myClass.value = user["class"];
  }

  _loadSchoolTerm() {
    if (DateTime.now().month >= 8) {
      term.value = 2;
    }
  }

  _getCurrentSubject() {
    int now = DateTime.now().hour * 100 + DateTime.now().minute;

    Map subjectTimes = {
      1100: 1,
      1200: 2,
      1350: 3,
      1440: 4,
      1540: 5,
      1640: 6,
    };
    
    for (int time in subjectTimes.keys) {
      if (now < time) {
        currentSubject.value = subjectTimes[time];
        break;
      }
    }
  }

  _loadTimeTable() async {
    List<List<String>> timetableRaw = await _dimigoinTimetable.getWeeklyTimeTable(myGrade.value, myClass.value);
    List<List<String>> timetableData = [];

    if (timetableRaw.isEmpty) {
      for (int day = 0; day < 5; day++) {
        timetableData.add(["", "", "", "", "", "", ""]);
      }

      timetable.value = timetableData;
      return;
    }

    for (int day = 0; day < 5; day++) {
      List<String> dailyTimetable = [];
      for (int subject = 0; subject < timetableRaw[day].length; subject++) {
        var isShorten = false;

        for (int i = 0; i < _ShortenSubject.values.length; i++) {
          if (_ShortenSubject.values[i].raw == timetableRaw[day][subject]) {
            dailyTimetable.add(_ShortenSubject.values[i].shorten);
            isShorten = true;
          }
        }

        if (!isShorten) {
          dailyTimetable.add(timetableRaw[day][subject]);
        }
      }

      if (day == 2) {
        dailyTimetable.add("");
      }
      timetableData.add(dailyTimetable);
    }

    timetable.value = timetableData;
    isDataEmpty.value = false;
  }

  @override
  void onInit() async {
    await _getGradeClass();
    await _loadTimeTable();
    _loadSchoolTerm();
    _getCurrentSubject();

    dataLoaded.value = true;

    // pageController.addListener(_changeTitleIndex);

    super.onInit();
  }
}