import 'package:dimigoin/pages/home/page.dart';
import 'package:dimigoin/pages/meal/page.dart';
import 'package:dimigoin/pages/register/page.dart';
import 'package:dimigoin/pages/schedule/page.dart';
import 'package:dimigoin/pages/studentID/page.dart';

import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

import 'package:get/get.dart';

class RootController extends GetxController {
  var currentIndex = 0.obs;
  var showPages = false.obs;
  var pages = [].obs;

  initializePages () async {
    pages.value = [
      HomePage(), 
      MealPage(), 
      SchedulePage(),
      // ignore: prefer_const_constructors
      RegisterPage(), 
      StudentIDPage(
        initializePages: initializePages
      )
    ];

    try {
      currentIndex.value = Get.arguments["page"];
    } on NoSuchMethodError { 
      currentIndex.value = 0;
    }

    showPages.value = true;
  }

  setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  auth() async {
    DimigoinAccount dimigoinAccount = DimigoinAccount();

    if(!await dimigoinAccount.checkNowLogin() || !await dimigoinAccount.validateAccessToken()) {
      Get.toNamed("auth", arguments: {"initializePages": initializePages});
    } else {
      await initializePages();
    }
  }
}
