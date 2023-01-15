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
        icon: Image.asset("assets/navigation/home.png"),
        activeIcon: Image.asset("assets/navigation/home_active.png")
      ),
      BottomNavigationBarItem(
        label: "급식",
        icon: Image.asset("assets/navigation/meal.png"),
        activeIcon: Image.asset("assets/navigation/meal_active.png")
      ),
      BottomNavigationBarItem(
        label: "일정",
        icon: Image.asset("assets/navigation/schedule.png"),
        activeIcon: Image.asset("assets/navigation/schedule_active.png")
      ),
      BottomNavigationBarItem(
        label: "신청",
        icon: Image.asset("assets/navigation/register.png"),
        activeIcon: Image.asset("assets/navigation/register_active.png")
      ),
      BottomNavigationBarItem(
        label: "학생증",
        icon: Image.asset("assets/navigation/studentID.png"),
        activeIcon: Image.asset("assets/navigation/studentID_active.png")
      ),  
    ];

    return Obx(() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: navigationItems,
      currentIndex: _rootController.currentIndex.value,
      onTap: _rootController.setCurrentIndex,
      selectedItemColor: const Color(0xFFE83C77),
      unselectedItemColor: const Color(0xFFD2D6DB),
      selectedFontSize: 12,
      unselectedFontSize: 12,
    ));
  }
}