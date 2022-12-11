import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentLocation = "3학년 1반";
  var selectedMealIndex = 0;
  List<Map> places = [
    {
      "name" : "교실",
      "icon" : "classroom",
      "isActive" : true
    },
    {
      "name" : "화장실",
      "icon" : "toilet",
      "isActive" : false
    },
    {
      "name" : "IT프로...",
      "icon" : "classroom",
      "isActive" : false
    },
    {
      "name" : "동아리...",
      "icon" : "club",
      "isActive" : false
    },
    {
      "name" : "기타",
      "icon" : "other",
      "isActive" : false
    }
  ];

  changeCurrentLocation(String location) {
    for (var place in places) {
      if (place["name"] == location) {
        place["active"] = true;
      } else if (place["active"] == true) {
        place["active"] = false;
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
