import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentLocation = "3학년 1반";
  var selectedMealIndex = 0;
  List<Map> places = [
    {
      "name" : "교실",
      "icon_name" : "classroom_active",
      "icon" : Image.asset("assets/home/classroom_active.png"),
      "color" : const Color(0xFFE83C77),
      "active" : true
    },
    {
      "name" : "화장실",
      "icon_name" : "toilet",
      "icon" : Image.asset("assets/home/toilet.png"),
      "color" : const Color(0xFFD2D6DB),
      "active" : false
    },
    {
      "name" : "IT프로...",
      "icon_name" : "classroom",
      "icon" : Image.asset("assets/home/classroom.png"),
      "color" : const Color(0xFFD2D6DB),
      "active" : false
    },
    {
      "name" : "동아리...",
      "icon_name" : "club",
      "icon" : Image.asset("assets/home/club.png"),
      "color" : const Color(0xFFD2D6DB),
      "active" : false
    },
    {
      "name" : "기타",
      "icon_name" : "other",
      "icon" : Image.asset("assets/home/other.png"),
      "color" : const Color(0xFFD2D6DB),
      "active" : false
    }
  ];

  changeCurrentLocation(String location) {
    for (var place in places) {
      if (place["name"] == location) {
        place["active"] = true;
        place["icon"] = Image.asset("assets/home/$place['asset']_active.png");
      } else if (place["active"] == true) {
        place["active"] = false;
        place["icon"] = Image.asset("assets/home/$place['asset'].png");
      }
    }
  }

  changeCurrentLoaction(String location) {
    currentLocation = location;
  }

  changeSelectedMeal(int mealIndex) {
    selectedMealIndex = mealIndex;
  }


}
