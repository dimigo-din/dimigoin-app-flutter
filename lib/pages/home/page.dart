import 'package:dimigoin/pages/home/widgets/current_location.dart';
import 'package:dimigoin/pages/home/widgets/today_meal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});
  final HomePageController homePageController = Get.put(HomePageController());
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: 350,
              margin: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10
                        ),
                        child: GestureDetector(
                          onTap: () {
                            DimigoinAccount dimigoinAccount = DimigoinAccount();

                            dimigoinAccount.logout();
                          },
                          child: Image.asset("assets/images/Logo.png"),
                        )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/images/alarm.png"),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10
                        ),
                        child: Column(
                          children: [
                            CurrentLocationWidget(),
                            TodayMealWidget()
                          ]
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ]
    );
  }
}
