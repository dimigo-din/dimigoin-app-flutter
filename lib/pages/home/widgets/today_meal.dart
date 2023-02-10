import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller.dart';

class TodayMealWidget extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());
  
  TodayMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      //height: 260,
      padding: const EdgeInsets.fromLTRB(5, 20, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      constraints: const BoxConstraints(
        minHeight: 260
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "오늘의 급식",
                      style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold
                      ),
                    ),
                    SvgPicture.asset("assets/images/home/next.svg")
                  ]
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                margin: const EdgeInsets.only(top: 20),
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => homePageController.changeSelectedMeal(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "아침",
                            style: TextStyle(
                              color: homePageController.selectedMealIndex.value == 0 ? const Color(0xFFE83C77) : const Color(0xFFD2D6DB),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          homePageController.selectedMealIndex.value == 0 ? Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:Color(0xFFE83C77)
                            ),
                          ) : Container(
                            margin: const EdgeInsets.only(top: 9),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => homePageController.changeSelectedMeal(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "점심",
                            style: TextStyle(
                              color: homePageController.selectedMealIndex.value == 1 ? const Color(0xFFE83C77) : const Color(0xFFD2D6DB),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          homePageController.selectedMealIndex.value == 1 ? Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:Color(0xFFE83C77)
                            ),
                          ) : Container(
                            margin: const EdgeInsets.only(top: 9),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => homePageController.changeSelectedMeal(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "저녁",
                            style: TextStyle(
                              color: homePageController.selectedMealIndex.value == 2 ? const Color(0xFFE83C77) : const Color(0xFFD2D6DB),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          homePageController.selectedMealIndex.value == 2 ? Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:Color(0xFFE83C77)
                            ),
                          ) : Container(
                            margin: const EdgeInsets.only(top: 9),
                          )
                        ],
                      ),
                    )
                  ],
                ),)
              )
            ]
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Obx(() => Text(
              homePageController.meal.value,
              style: const TextStyle(
                color: Color(0xFFB1B8C1)
              ),
            )),
          )
        ],
      ),
    );
  }
}