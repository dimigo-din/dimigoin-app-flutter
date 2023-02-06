import 'package:dimigoin/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';

class Navigation extends GetView<RootController> {
  Navigation({super.key});
  final RootController _rootController = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> navigationItems = [
      BottomNavigationBarItem(
        label: "홈",
        icon: Image.asset("assets/images/navigation/home.png"),
        activeIcon: Image.asset("assets/images/navigation/home_active.png")
      ),
      BottomNavigationBarItem(
        label: "급식",
        icon: Image.asset("assets/images/navigation/meal.png"),
        activeIcon: Image.asset("assets/images/navigation/meal_active.png")
      ),
      BottomNavigationBarItem(
        label: "일정",
        icon: Image.asset("assets/images/navigation/schedule.png"),
        activeIcon: Image.asset("assets/images/navigation/schedule_active.png")
      ),
      BottomNavigationBarItem(
        label: "신청",
        icon: Image.asset("assets/images/navigation/register.png"),
        activeIcon: Image.asset("assets/images/navigation/register_active.png")
      ),
      BottomNavigationBarItem(
        label: "학생증",
        icon: Image.asset("assets/images/navigation/studentID.png"),
        activeIcon: Image.asset("assets/images/navigation/studentID_active.png")
      ),  
    ];

    return Obx(() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: navigationItems,
      currentIndex: _rootController.currentIndex.value,
      onTap: _rootController.setCurrentIndex,
      selectedItemColor: DimigoinColor.DIMI_MAGENTA,
      unselectedItemColor: DimigoinColor.C3,
      selectedFontSize: 12,
      unselectedFontSize: 12,
    ));
  }
}