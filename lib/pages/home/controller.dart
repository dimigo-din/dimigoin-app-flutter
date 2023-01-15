import 'package:get/get.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

class HomePageController extends GetxController {
  var currentLocation = "3학년 1반";
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

  List dailyMeals = [].obs;
  final meal = "".obs;

  final DimigoinMeal _dimigoinMeal = DimigoinMeal();
  var selectedMealIndex = 0.obs;

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

  _mealToString(List<dynamic> meal) {
    if (meal.isEmpty) {
      return "급식이 없습니다";
    }

    String result = "";
    num count = 0;
    for (int i = 0; i < meal.length; i++) {
      count += meal[i].length + 3;

      if (i != meal.length - 1) {
        result += "${meal[i]} | ";

        if (count >= 18 || meal[i].length > 15) {
          result += "\n";
          count = 0;
        }
      } else {
        result += meal[i];
      }
    }

    return result;
  }

  setMeal() async { // set daily meal
    Map dailyMealInfo = await _dimigoinMeal.getDailyMeal(true);

    if (dailyMealInfo.isEmpty) {
      dailyMeals = ["급식 정보를 불러올 수 없습니다", "급식 정보를 불러올 수 없습니다", "급식 정보를 불러올 수 없습니다"];
      return;
    }

    dailyMeals.add(_mealToString(dailyMealInfo["breakfast"]));
    dailyMeals.add(_mealToString(dailyMealInfo["lunch"]));
    dailyMeals.add(_mealToString(dailyMealInfo["dinner"]));

    meal.value = dailyMeals[selectedMealIndex.value];
  }

  changeSelectedMeal(int mealIndex) {
    setMeal();

    selectedMealIndex.value = mealIndex;
    meal.value = dailyMeals[selectedMealIndex.value];
  }
}
