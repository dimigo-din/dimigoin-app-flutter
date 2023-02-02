import 'package:dimigoin/pages/register/widgets/register_button.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class RegisterPage extends GetView<RegisterPageController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 96),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text("신청하기", style: DimigoinTextStyle.T1.copyWith(fontSize: 26)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegisterButton(btnMode: RegisterButtonMode.laundry),
                  RegisterButton(btnMode: RegisterButtonMode.weekendStay),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegisterButton(btnMode: RegisterButtonMode.mealException),
                  RegisterButton(btnMode: RegisterButtonMode.reveille),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}