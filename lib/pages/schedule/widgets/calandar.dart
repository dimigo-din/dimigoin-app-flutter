import 'package:dimigoin/pages/schedule/controller.dart';
import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

final _korWeekDay = ["월", "화", "수", "목", "금", "토", "일"];
final _thisYear = DateTime.now().year;

class Calender extends StatelessWidget {
  final SchedulePageController controller;

  const Calender({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 350,
          child: Column(
            children: [
              SizedBox(
                height: 370,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(_thisYear, 1, 1),
                      lastDay: DateTime.utc(_thisYear, 12, 31),
                      availableGestures: AvailableGestures.none,
                      headerVisible: false,
                      daysOfWeekHeight: 50,
                      onCalendarCreated: (PageController calendarController) => controller.calendarController = calendarController,
                      eventLoader: (day) {
                        // add events
                        return [];
                      },
                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (BuildContext context, DateTime day) {
                          final text = _korWeekDay[day.weekday - 1];
                    
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  text,
                                  style: DimigoinTextStyle.T5.copyWith(
                                    color: DimigoinColor.C2
                                  )
                                ),
                                Container(
                                  height: 0.5,
                                  color: DimigoinColor.C2,
                                )
                              ],
                            ),
                          );
                        },
                        prioritizedBuilder: (BuildContext context, DateTime day, DateTime selectedDay) {
                          bool focusedDay = day == selectedDay;
                          bool focusedMonth = day.month == selectedDay.month;
                    
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: focusedDay ? DimigoinColor.DIMI_MAGENTA : Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: DimigoinTextStyle.T5.copyWith(
                                      color: focusedDay ? Colors.white : focusedMonth ? DimigoinColor.C2 : DimigoinColor.C3
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                width: 350,
                color: DimigoinColor.C2,
              )
            ],
          ),
        )
      ],
    );
  }
}