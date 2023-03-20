import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/utils/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Root extends GetView<RootController> {
  final RootController _rootController = Get.put(RootController());

  Root({super.key}) {
    _rootController.auth();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: _rootController.currentIndex.value == 0 ? DimigoinColor.C4 : Colors.white,
      body: _rootController.showPages.value ? _rootController.pages[_rootController.currentIndex.value] : const SizedBox(),
      bottomNavigationBar: Navigation(),
    ));
  }
}
