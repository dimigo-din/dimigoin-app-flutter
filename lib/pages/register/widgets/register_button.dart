import 'package:dalgeurak_meal_application/routes/routes.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../themes/color_theme.dart';

enum RegisterButtonMode {
  laundry,
  reveille,
  weekendStay,
  mealException,
  specialRoom,
  fridayHomecoming

}

extension RegisterButtonModeExtension on RegisterButtonMode {
  String get getIconName {
    switch (this) {
      case RegisterButtonMode.laundry: return "washer";
      case RegisterButtonMode.reveille: return "music";
      case RegisterButtonMode.weekendStay: return "book";
      case RegisterButtonMode.mealException: return "tableware";
      case RegisterButtonMode.specialRoom: return "specialRoom";
      case RegisterButtonMode.fridayHomecoming: return "homecoming";
      default: return "";
    }
  }

  String get getTitle {
    switch (this) {
      case RegisterButtonMode.laundry: return "세탁";
      case RegisterButtonMode.reveille: return "기상송";
      case RegisterButtonMode.weekendStay: return "주말잔류";
      case RegisterButtonMode.mealException: return "선밥/후밥";
      case RegisterButtonMode.specialRoom: return "특별실";
      case RegisterButtonMode.fridayHomecoming: return "금요귀가";
      default: return "";
    }
  }

  dynamic get getTapFunction {
    switch (this) {
      case RegisterButtonMode.mealException: return () => Get.toNamed(DalgeurakMealApplicationRoutes.MEALEXCEPTION);
      default: return () => print("onClick");
    }
  }
}

class RegisterButton extends GetWidget {
  RegisterButtonMode btnMode;

  RegisterButton({required this.btnMode});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnMode.getTapFunction,
      child: Container(
        height: 125,
        width: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: DimigoinColor.C6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/register/${btnMode.getIconName}.svg", width: 60),
            const SizedBox(height: 8),
            Text(btnMode.getTitle, style: DimigoinTextStyle.T4)
          ],
        ),
      ),
    );
  }

}