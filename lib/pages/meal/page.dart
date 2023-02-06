import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dimigoin/pages/meal/controller.dart';

class MealPage extends GetView<MealController> {
  final MealController _mealController = Get.put(MealController());

  MealPage({super.key}) {
    _mealController.getWeeklyMeal(); // 오늘 급식 불러오기
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          margin: const EdgeInsets.only(
            top: 75
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "${DateTime.now().month}월 ${_mealController.getWeekOfMonth()}째 주",
                        style: const TextStyle(
                          color: Color(0xffB1B8C1),
                          fontSize: 14
                        ),
                      ),
                      const Text("주간 급식표")
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 24
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    
                  ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}