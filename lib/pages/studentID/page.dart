import 'package:dimigoin/routes/route.dart';
import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller.dart';

class StudentIDPage extends GetView<StudentIDController> {
  final StudentIDController _studentIDController = Get.put(StudentIDController());
  final void Function() initializePages;

  StudentIDPage({
    super.key,
    required this.initializePages
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      onGenerateRoute: (settings) {
        if (settings.name == DimigoinRoutes.PUNISHMENTS) { // 지도 일지
          return GetPageRoute(
            routeName: DimigoinRoutes.PUNISHMENTS,
            page: () => const SizedBox(),
            transition: Transition.downToUp
          );
        } else if (settings.name == DimigoinRoutes.LECTURES) { // 내 수강 내역
          return GetPageRoute(
            routeName: DimigoinRoutes.LECTURES,
            page: () => const SizedBox()
          );
        } else {
          return GetPageRoute(
            routeName: DimigoinRoutes.STUDENTID,
            page: () => _StudentIDPage(
              controller: _studentIDController,
              initializePages: initializePages,
            )
          );
        }
      },
    );
  }
}

class _StudentIDPage extends StatelessWidget {
  final StudentIDController controller;
  final void Function() initializePages;

  const _StudentIDPage({
    required this.controller,
    required this.initializePages
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                SizedBox(
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "내정보",
                        style: DimigoinTextStyle.T1.copyWith(
                          fontSize: 26
                        )
                      ),
                      IconButton(
                        onPressed: () {
                          controller.logout(initializePages);
                        },
                        icon: SvgPicture.asset("assets/images/studentID/logout.svg")
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: DimigoinColor.DIMI_MAGENTA
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 320,
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/studentID/dimigo.svg"),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTapUp: (details) => controller.openIDCard(),
                                  child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                    ),
                                    child: Center(
                                      child: Text(
                                        "터치하여 모바일 학생증 열기",
                                        style: DimigoinTextStyle.T6.copyWith(
                                          color: DimigoinColor.DIMI_MAGENTA
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: DimigoinColor.C4
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/studentID/important.svg"),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          "사용 전 다음 내용을 반드시 읽어주세요",
                          style: DimigoinTextStyle.T6.copyWith(
                            color: DimigoinColor.C2
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                SizedBox(
                  width: 310,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/studentID/punishments.svg"),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "지도 일지",
                          style: DimigoinTextStyle.T4.copyWith(
                            color: DimigoinColor.C1,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/images/studentID/next.svg"),
                      const SizedBox(
                        width: 4,
                      )
                    ]
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 310,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/studentID/classhistory.svg"),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "내 수강 내역",
                          style: DimigoinTextStyle.T4.copyWith(
                            color: DimigoinColor.C1,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/images/studentID/next.svg"),
                      const SizedBox(
                        width: 4,
                      )
                    ]
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}