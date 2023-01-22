import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import './controller.dart';

class Auth extends GetView<AuthController> {
  final AuthController _authController = Get.put(AuthController());
  Auth({super.key});

  final TextEditingController id = TextEditingController();
  final TextEditingController pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: SvgPicture.asset("assets/Logo.svg")
                )
              ],
            ),
            SizedBox(
              width: 320,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      keyboardType: TextInputType.text, 
                      controller: id,
                      onChanged: _authController.idInput,
                      decoration: InputDecoration(
                        hintText: "아이디를 입력하세요",
                        hintStyle: const TextStyle(
                          color: Color(0xFFD1D1D1),
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFF2F2F2)
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFE83C77)
                          )
                        ),
                      ),
                      cursorColor: const Color(0xFFE83C77),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: pwd,
                      onChanged: _authController.pwdInput,
                      decoration: InputDecoration(
                        hintText: "패스워드를 입력하세요",
                        hintStyle: const TextStyle(
                          color: Color(0xFFD1D1D1),
                          fontSize: 14
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFF2F2F2)
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFE83C77)
                          )
                        ),
                      ),
                      obscureText: true,
                      cursorColor: const Color(0xFFE83C77),
                    )
                  ),
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE83C77),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: const Text("로그인"),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 6
                    ),
                    child: SizedBox(
                      width: 344,
                      height: 50,
                      child: Obx(() => Text(
                        controller.isLoginFailed.value ? "로그인 중 오류가 발생했습니다.\n계정 정보와 인터넷 연결을 확인해주세요" : "",
                        style: const TextStyle(
                          fontSize: 14
                        ),
                      )),
                    )
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}