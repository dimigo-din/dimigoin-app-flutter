import 'package:dimigoin/pages/home/widgets/current_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});
  final HomePageController homePageController = Get.put(HomePageController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F5),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10
                          ),
                          child: Image.asset("assets/Logo.png"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("assets/alarm.png"),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10
                          ),
                          child: Column(
                            children: [
                              CurrentLocationWidget()
                            ]
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
