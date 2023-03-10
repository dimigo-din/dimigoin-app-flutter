import 'package:dimigoin/pages/schedule/controller.dart';
import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatelessWidget {
  final SchedulePageController controller;

  const TimeTable({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25
      ),
      child: SizedBox(
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _generateWeekday(),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1,
              color: DimigoinColor.C4,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _generateTimetable()
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _generateWeekday() {
    List<Widget> weekDays = [];
    int today = DateTime.now().day;

    for (int day = 0; day < 5; day++) {
      weekDays.add(
        Text(
          controller.weekDay[day],
          style: DimigoinTextStyle.T3.copyWith(
            color: today == day ? DimigoinColor.C1 : DimigoinColor.C2
          ),
        )
      );
    }

    return weekDays;
  }

  Widget _generateDailySchedule(List<String> schedule, Color color, bool today) {
    List<Widget> subjects = [];

    for (int i = 0; i < schedule.length; i++) {
      subjects.add(Container(
        width: 65,
        height: 35,
        decoration: BoxDecoration(
          color: controller.currentSubject.value == i && today ? DimigoinColor.DIMI_MAGENTA : Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 2
            ),
            child: Text(
              schedule[i],
              style: DimigoinTextStyle.T4.copyWith(
                color: controller.currentSubject.value == i && today ? Colors.white : color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ));

      subjects.add(const SizedBox(
        height: 16,
      ));
    }

    return Column(
      children: subjects
    );
  }

  List<Widget> _generateTimetable() {
    List<Widget> timetable = [];

    for (int i = 0; i < controller.timetable.length; i++) {
      Color color = i == DateTime.now().weekday ? DimigoinColor.C1 : DimigoinColor.C2;

      timetable.add(_generateDailySchedule(controller.timetable[i], color, i == DateTime.now().weekday));
    }

    return timetable;
  }
}
