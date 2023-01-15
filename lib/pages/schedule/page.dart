import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SchedulePage extends GetView<SchedulePageController> {
  SchedulePage({super.key});
  final SchedulePageController schedulePageController = Get.put(SchedulePageController());

  @override
  Widget build(BuildContext context) {
    return const Text("schedule page");
  }
}