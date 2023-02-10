import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:get/get.dart';

import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';

import '../controller.dart';
import '../widgets/meal_card.dart';

enum MealType {
  breakfast,
  lunch,
  dinner
}

extension MealTypeExtension on MealType {
  String get string {
    switch (this) {
      case MealType.breakfast: return "아침";
      case MealType.lunch: return "점심";
      case MealType.dinner: return "저녁";
    }
  }
}

class _MealTabController extends GetxController with GetSingleTickerProviderStateMixin {
  CustomTabBarController controller = CustomTabBarController();
  PageController pageController = PageController(initialPage: DateTime.now().weekday - 1);

  var weekDay = ["월", "화", "수", "목", "금", "토", "일"];
}

class MealTabView extends StatelessWidget {
  final MealController mealController;

  const MealTabView({
    super.key,
    required this.mealController
  });

  @override
  Widget build(BuildContext context) {
    final _MealTabController controller = Get.put(_MealTabController());
    controller.controller.setCurrentIndex(DateTime.now().weekday - 1);

    return Column(
      children: [
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
                    itemCount: 7,
                    tabBarController: controller.controller,
                    pageController: controller.pageController,
                    height: 45,
                    width: 350,
                    indicator: RoundIndicator(
                      color: Colors.white,
                      top: 2.5,
                      bottom: 2.5,
                      left: -1,
                      right: -1,
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
                              constraints: BoxConstraints(minWidth: (Get.width / 7.8)),
                              child: Text(
                                controller.weekDay[index],
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
                  itemCount: 7,
                  itemBuilder: generateMeals
                ),
              )
            ],
          )
        ),
      ],
    );
  }

  Widget generateMeals(BuildContext context, int index) {
    List<Widget> cards = [];

    for (int i = 0; i < 3; i++) {
      cards.add(
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8
          ),
          child: MealCard(
            type: MealType.values[i].string,
            meal: mealController.weeklyMeal[index][i],
            time: mealController.mealTime[mealController.myClass.value][i],
            index: i,
            now: mealController.currentMeal.value == i,
            toggleSchedulePannel: mealController.toggleSchedulePannel
          ),
        )
      );
    }

    cards.add(const SizedBox(height: 20));

    return SizedBox(
      width: 340,
      height: Get.height * 0.8,
      child: ListView(
        padding: const EdgeInsets.only(
          left: 15,
          right: 10
        ),
        children: cards
      ),
    );
  }
}