import 'package:dimigoin/pages/home/widgets/current_location.dart';
import 'package:dimigoin/pages/home/widgets/today_meal.dart';
import 'package:dimigoin/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller.dart';

import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});
  final HomePageController homePageController = Get.put(HomePageController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DimigoinColor.C4,
      body: Row(
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
                            child: SvgPicture.asset(
                              "assets/images/Logo.svg",
                              width: 30,
                              height: 30,
                            ),
                          )
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/images/alarm.svg",
                              width: 30,
                              height: 30,
                            ),
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
      ),
    );
  }
}
