import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dimigoin/routes/route.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:dimigoin/pages/meal/widgets/meal_tabview.dart';
import 'package:dimigoin/pages/meal/widgets/meal_schedule.dart';

import './controller.dart';

class MealPage extends GetView<MealController> {
  final MealController _mealController = Get.put(MealController());

  MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(0),
      onGenerateRoute: (settings) {
        if (settings.name == DimigoinRoutes.MEALSCHEDULE) {
          return GetPageRoute(
            routeName: DimigoinRoutes.MEALSCHEDULE,
            page: () => MealSchedule(
              controller: _mealController,
            ),
            transition: Transition.rightToLeft
          );
        } else {
          return GetPageRoute(
            routeName: DimigoinRoutes.MEAL,
            page: () => _MealPage(
              controller: _mealController,
            )
          );
        }
      },
    );
  }
}

class _MealPage extends StatelessWidget {
  final MealController controller;
  const _MealPage({
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 370,
            margin: const EdgeInsets.only(
              top: 75
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2.5
                            ),
                            child: Text(
                              "${DateTime.now().month}월 ${controller.getWeekOfMonth()}째 주",
                              style: DimigoinTextStyle.T5.copyWith(
                                color: const Color(0xFFB1B8C1),
                              )
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "주간 급식표",
                            style: DimigoinTextStyle.T1.copyWith(
                              fontSize: 26
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24
                  ),
                  child: Obx(() => controller.dataLoaded.value ?
                    MealTabView(
                      mealController: controller,
                    ) : const SizedBox(width: 360)
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
