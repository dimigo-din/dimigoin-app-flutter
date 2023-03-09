import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:get/get.dart';

import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

class SchedulePageController extends GetxController with GetSingleTickerProviderStateMixin {
  var myGrade = 0.obs;
  var myClass = 0.obs;
  var titleIndex = 0.obs;
  var term = 1.obs;
  var monthIndex = DateTime.now().month.obs;
  var weekDay = ["월", "화", "수", "목", "금"];
  var timetable = [ // 더미데이터
    ["국어", "국어", "국어", "국어", "국어", "국어", "국어"], 
    ["국어", "국어", "국어", "국어", "국어", "국어", "국어"],
    ["국어", "국어", "국어", "국어", "국어", "국어", ""],
    ["국어", "국어", "국어", "국어", "국어", "국어", "국어"],
    ["국어", "국어", "국어", "국어", "국어", "국어", "국어"],
  ].obs;
  var currentSubject = 0.obs;

  final DimigoinAccount _dimigoinAccount = DimigoinAccount();

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

  _changeTitleIndex() {
    if (titleIndex.value != tabController.currentIndex) {
      titleIndex.value = tabController.currentIndex;
    }
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
    // load time table data from server
  }

  @override
  void onInit() async {
    await _getGradeClass();
    await _loadTimeTable();
    _loadSchoolTerm();
    _getCurrentSubject();

    pageController.addListener(_changeTitleIndex);

    super.onInit();
  }
}