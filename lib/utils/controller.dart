import 'package:dimigoin/pages/home/page.dart';
import 'package:dimigoin/pages/meal/page.dart';
import 'package:dimigoin/pages/register/page.dart';
import 'package:dimigoin/pages/schedule/page.dart';
import 'package:dimigoin/pages/studentID/page.dart';
import 'package:dimigoin/pages/auth/page.dart';

import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RootController extends GetxController {
  var currentIndex = 2.obs;
  var currentPage = pages[2].obs;

  // ignore: prefer_const_constructors
  static List<Widget> pages = [HomePage(), MealPage(), SchedulePage(), RegisterPage(), StudentIDPage()];

  setCurrentIndex(int index) {
    currentIndex.value = index;
    currentPage.value = pages[index];
  }

  auth() async {
    DimigoinAccount dimigoinAccount = DimigoinAccount();

    if(!await dimigoinAccount.checkNowLogin()) {
      Get.to(() => Auth());
    }
  }
}
