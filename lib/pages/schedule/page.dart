import 'package:dimigoin/pages/schedule/widgets/timetable.dart';
import 'package:dimigoin/pages/schedule/widgets/titles.dart';
import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SchedulePage extends GetView<SchedulePageController> {
  final SchedulePageController _controller = Get.put(SchedulePageController());

  SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 75,
              ),
              SizedBox(
                width: 370,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2.5
                            ),
                            child: Obx(() => Text(
                              "${DateTime.now().year}학년도 ${_controller.term.value}학기 ${_controller.myGrade.value}학년 ${_controller.myClass.value}반",
                              style: DimigoinTextStyle.T5.copyWith(
                                color: DimigoinColor.C2
                              )),
                            )
                          ),
                          const SizedBox(
                            height: 5
                          ),
                          Titles(
                            controller: _controller
                          ).widgets[_controller.tabController.currentIndex],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 360,
                      decoration: BoxDecoration(
                        color: DimigoinColor.C4,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                        child: CustomTabBar(
                          itemCount: 2,
                          tabBarController: controller.tabController,
                          pageController: controller.pageController,
                          height: 50,
                          width: 350,
                          indicator: RoundIndicator(
                            color: Colors.white,
                            top: 2.5,
                            bottom: 2.5,
                            left: 0,
                            right: 0,
                            radius: BorderRadius.circular(25)
                          ),
                          builder: ((BuildContext context, int index) => 
                            TabBarItem(
                              transform: ColorsTransform(
                                highlightColor: Colors.black,
                                normalColor: Colors.grey,
                                builder: (BuildContext context, color) =>
                                  Container(
                                    alignment: Alignment.center,
                                    constraints: const BoxConstraints(minWidth: (350 / 2)),
                                    child: Text(
                                      TitlesEnum.values[index].string,
                                      style: DimigoinTextStyle.T4.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: color
                                      ),
                                    ),
                                  )
                              ),
                              index: index,
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
              SizedBox(
                width: Get.width,
                height: Get.height * 0.55,
                child: PageView.builder(
                  controller: _controller.pageController,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return TimeTable(controller: _controller);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}