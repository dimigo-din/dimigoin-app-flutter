import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:dimigoin/pages/meal/widgets/schedule_tabview.dart';

import 'package:get/get.dart';

import '../controller.dart';

class MealSchedule extends StatelessWidget {
  final MealController controller;

  const MealSchedule({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 370,
              margin: const EdgeInsets.only(
                top: 75
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "급식시간 제공: 달그락",
                              style: DimigoinTextStyle.T5.copyWith(
                                color: DimigoinColor.C2
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 320,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "학급별 급식시간",
                                    style: DimigoinTextStyle.T1.copyWith(
                                      fontSize: 26
                                    ),
                                  ),
                                  InkWell(
                                    child: SvgPicture.asset(
                                      "assets/images/meal/cancel.svg",
                                      width: 18,
                                      height: 18,
                                    ),
                                    onTap: () {
                                      Get.back(id: 0);
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ScheduleTabView(
                    schedule: controller.mealOrder,
                    myClass: controller.myClass.value,
                    selectedSchedule: controller.selectedSchedule.value
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}