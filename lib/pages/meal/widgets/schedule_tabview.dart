import 'package:flutter_custom_tab_bar/library.dart';
import 'package:flutter/material.dart';

import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

import 'package:get/get.dart';

class _ScheduleTabController extends GetxController with GetSingleTickerProviderStateMixin {
  CustomTabBarController controller = CustomTabBarController();
  
  late PageController pageController;
  final int initialPage;

  _ScheduleTabController({
    required this.initialPage
  }) {
    pageController = PageController(initialPage: initialPage);
    controller.setCurrentIndex(initialPage);
  }

  @override
  void onInit() {
    controller.setCurrentIndex(initialPage);
  }
}

class ScheduleTabView extends StatelessWidget {
  final List schedule;
  final int myClass;
  final RxInt selectedSchedule;

  const ScheduleTabView({
    super.key,
    required this.schedule,
    required this.myClass,
    required this.selectedSchedule
  });

  @override
  Widget build(BuildContext context) {
    final _ScheduleTabController controller = Get.put(_ScheduleTabController(initialPage: selectedSchedule.value));
    controller.controller.setCurrentIndex(selectedSchedule.value);

    return Center(
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
                itemCount: 3,
                tabBarController: controller.controller,
                pageController: controller.pageController,
                height: 45,
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
                      builder: (BuildContext context, color) {
                        return Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(minWidth: (350 / 3)),
                          child: Text(
                            MealType.values[index].convertKor2Str,
                            style: DimigoinTextStyle.T4.copyWith(
                              fontWeight: FontWeight.w600,
                              color: color
                            ),
                          ),
                        );
                      }
                    ),
                    index: index,
                  )
                ),
              ),
            ),
          ),
          Container(
            width: 360,
            height: Get.height * 0.65,
            margin: const EdgeInsets.only(
              top: 10
            ),
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: 3,
              itemBuilder: generateSchedule
            ),
          )
        ],
      ),
    );
  }
  
  Widget generateSchedule(BuildContext context, int index) {
    List<Widget> cards = [];

    var rank = 1;
    var previousTime = 0;
    for (int i = 0; i < 6; i++) {
      cards.add(
        const SizedBox(
          height: 10,
        )
      );
      cards.add(
        ScheduleCard(
          rank: "$rank순위",
          time: schedule[index][i]["time"],
          classIndex: schedule[index][i]["class"],
          myClass: "${myClass + 1}" == schedule[index][i]["class"].substring(4, 5)
        )
      );

      if (previousTime < schedule[index][i]["raw"]) {
        previousTime = schedule[index][i]["raw"];
        rank++;
      }
    }

    return Column(
      children: cards
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String rank;
  final String time;
  final String classIndex;
  final bool myClass;

  const ScheduleCard({
    super.key,
    required this.rank,
    required this.time,
    required this.classIndex,
    required this.myClass
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myClass ? DimigoinColor.DIMI_MAGENTA : Colors.white
      ),
      child: Center(
        child: SizedBox(
          width: 285,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rank,
                style: DimigoinTextStyle.T6.copyWith(
                  fontWeight: FontWeight.w600,
                  color: myClass ? Colors.white : DimigoinColor.C1
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  classIndex,
                  style: DimigoinTextStyle.T4.copyWith(
                    fontWeight: FontWeight.w600,
                    color: myClass ? Colors.white : DimigoinColor.C1
                  ),
                )
              ),
              Text(
                time,
                style: DimigoinTextStyle.T5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: myClass ? Colors.white : DimigoinColor.C1
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}