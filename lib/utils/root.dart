import 'package:dimigoin/utils/bottom_navigation_bar.dart';
import 'package:dimigoin/pages/home/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Root extends GetView<RootController> {
  Root({super.key});
  final RootController _rootController = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F5),
      body: Obx(() => _rootController.currentPage.value),
      bottomNavigationBar: Navigation(),
    );
  }
}