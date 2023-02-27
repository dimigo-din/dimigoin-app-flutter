import 'package:dimigoin/pages/schedule/controller.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum TitlesEnum {
  timatable,
  calender
}

extension TitlesStringExtension on TitlesEnum {
  String get string {
    switch (this) {
      case TitlesEnum.timatable:
        return "학급시간표";
      case TitlesEnum.calender:
        return "학사일정";
    }
  }
}

class Titles {
  SchedulePageController controller;

  Widget timetable = Text(
    "학급시간표",
    style: DimigoinTextStyle.T1.copyWith(
      fontSize: 26
    ),
  );
  late Widget calender;
  List<Widget> widgets = [];

  Titles({
    required this.controller
  }) {
    calender = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "학사일정",
          style: DimigoinTextStyle.T1.copyWith(
            fontSize: 26
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTapUp: (details) {
                controller.increaseMonth(-1);
              },
              child: SvgPicture.asset("assets/images/schedule/previous.svg"),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "${controller.monthIndex.value}월",
              style: DimigoinTextStyle.T2.copyWith(
                fontSize: 20
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTapUp: ((details) {
                controller.increaseMonth(1);
              }),
              child: SvgPicture.asset("assets/images/schedule/next.svg"),
            )
          ],
        )
      ],
    );

    widgets.add(timetable);
    widgets.add(calender);
  }
}
