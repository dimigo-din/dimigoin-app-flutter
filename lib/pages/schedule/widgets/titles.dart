import 'package:dimigoin/pages/schedule/controller.dart';
import 'package:dimigoin/themes/color_theme.dart';
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
    calender = SizedBox(
      width: 325,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "학사일정",
            style: DimigoinTextStyle.T1.copyWith(
              fontSize: 26
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTapUp: (details) {
                      controller.decreaseMonth();
                    },
                    child: SvgPicture.asset("assets/images/schedule/previous.svg"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${controller.monthIndex.value}월",
                    style: DimigoinTextStyle.T2.copyWith(
                      fontSize: 20,
                      color: DimigoinColor.C2
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTapUp: ((details) {
                      controller.increaseMonth();
                    }),
                    child: SvgPicture.asset("assets/images/schedule/next.svg"),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );

    widgets.add(timetable);
    widgets.add(calender);
  }
}
