import 'package:dimigoin/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        icon: SvgPicture.asset("assets/images/navigation/home.svg"),
        activeIcon: SvgPicture.asset("assets/images/navigation/home_active.svg")
      ),
      BottomNavigationBarItem(
        label: "급식",
        icon: SvgPicture.asset("assets/images/navigation/meal.svg"),
        activeIcon: SvgPicture.asset("assets/images/navigation/meal_active.svg")
      ),
      BottomNavigationBarItem(
        label: "일정",
        icon: SvgPicture.asset("assets/images/navigation/schedule.svg"),
        activeIcon: SvgPicture.asset("assets/images/navigation/schedule_active.svg")
      ),
      BottomNavigationBarItem(
        label: "신청",
        icon: SvgPicture.asset("assets/images/navigation/register.svg"),
        activeIcon: SvgPicture.asset("assets/images/navigation/register_active.svg")
      ),
      BottomNavigationBarItem(
        label: "학생증",
        icon: SvgPicture.asset("assets/images/navigation/studentID.svg"),
        activeIcon: SvgPicture.asset("assets/images/navigation/studentID_active.svg")
      ),  
    ];

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20)
      ),
      child: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navigationItems,
        currentIndex: _rootController.currentIndex.value,
        onTap: _rootController.setCurrentIndex,
        selectedItemColor: DimigoinColor.DIMI_MAGENTA,
        unselectedItemColor: DimigoinColor.C3,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      )),
    );
  }
}