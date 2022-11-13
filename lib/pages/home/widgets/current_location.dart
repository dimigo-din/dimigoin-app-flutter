import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class CurrentLocationWidget extends StatelessWidget {
  CurrentLocationWidget({super.key});
  final HomePageController homePageController = Get.put(HomePageController());
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 185,
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      padding: const EdgeInsets.fromLTRB(5, 20, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "나의 위치",
                      style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold
                      ),
                    ),
                    Image.asset("assets/direction.png")
                  ]
                )
              )
            ],
          ),
          Container(
            width: 320,
            margin: const EdgeInsets.only(
              top: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: homePageController.places.map(
                (place) => 
                  GestureDetector(
                  child: SizedBox(
                    width: 45,
                    child: Column (
                      children: [
                        place["icon"],
                        Text(
                          place["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: place["color"],
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ).toList()
            ),
          )
        ]
      ),
    );
  }
}