import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

class MealController extends GetxController {
  var currentMeal = 0.obs;
  var weeklyMeal = [].obs;
  var mealTime = [].obs;
  var myClass = 0.obs;

  var dispalySchedule = false.obs;
  var selectedSchedule = 0.obs;

  var dataLoaded = false.obs;

  final DimigoinAccount _dimigoinAccount = DimigoinAccount();
  final DimigoinMeal _dimigoinMeal = DimigoinMeal();
  final DalgeurakService _dalgeurakService = DalgeurakService();

  final _hangeulIndex = ["첫", "둘", "셋", "넷", "다섯", "여섯"];

  toggleSchedulePannel(int? index) {
    dispalySchedule.value = !dispalySchedule.value;

    if (index != null) {
      print("togglePannel");
      selectedSchedule.value = index;
    }
  }

  _mealToString(List<dynamic> meal) {
    if (meal.isEmpty) {
      return "급식이 없습니다";
    }

    String result = "";
    for (int i = 0; i < meal.length; i++) {
      if (i != meal.length - 1) {
        result += "${meal[i]} | ";
      } else {
        result += meal[i];
      }
    }

    return result;
  }

  _setCurrentMeal(int lunch, int dinner) {
    var datetime = DateTime.now();
    var time = datetime.hour * 100 + datetime.minute;

    if (time > dinner) {
      currentMeal.value = 0;
    } else if (time > lunch) {
      currentMeal.value = 2;
    } else if (time > 800) {
      currentMeal.value = 1;
    }
  }

  _getMealTime() async {
    var mealSchedule = await _dalgeurakService.getMealTime();
    mealSchedule = mealSchedule["content"]["mealTimes"];

    await _dimigoinAccount.fetchAccountData();
    var user = _dimigoinAccount.currentUser.toJson();
    myClass.value = user["class"] - 1;

    var minuteFormat = NumberFormat("00");

    for (int classNum = 0; classNum < 6; classNum++) {
      List<String> classMealTime = [];

      var breakfast = mealSchedule["breakfast"][user["grade"] - 1][classNum];
      var lunch = mealSchedule["lunch"][user["grade"] - 1][classNum];
      var dinner = mealSchedule["dinner"][user["grade"] - 1][classNum];

      classMealTime.add("오전 ${breakfast ~/ 100}:${minuteFormat.format(breakfast % 100)}");
      classMealTime.add("오후 ${(lunch - 1200) ~/ 100 == 0 ? "12" : (lunch - 1200) ~/ 100}:${minuteFormat.format(lunch % 100)}");
      classMealTime.add("오후 ${(dinner - 1200) ~/ 100}:${minuteFormat.format(dinner % 100)}");

      mealTime.add(classMealTime);

      if (classNum == myClass.value) {
        _setCurrentMeal(lunch, dinner);
      }
    }
  }

  getWeekOfMonth() {
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month, 1).weekday;

    int weekOfMonth = 0;
    for (int i = firstDay * -1; i < now.day; i += 7) {
      weekOfMonth++;
    }

    return _hangeulIndex[weekOfMonth - 1];
  }

  getWeeklyMeal() async {
    var weeklyMealInfo = await _dimigoinMeal.getWeeklyMeal();

    for (int day = 0; day < 7; day++) {
      Map dailyMealInfo = weeklyMealInfo[day];

      if (dailyMealInfo.isEmpty) {
        weeklyMeal.add(["급식이 없습니다", "급식이 없습니다", "급식이 없습니다"]);
        continue;
      }

      weeklyMeal.add([
        _mealToString(dailyMealInfo["breakfast"]),
        _mealToString(dailyMealInfo["lunch"]),
        _mealToString(dailyMealInfo["dinner"])
      ]);
    }

    await _getMealTime();

    dataLoaded.value = true;
  }

  @override
  void onInit() async {
    await getWeeklyMeal();
  }
}
