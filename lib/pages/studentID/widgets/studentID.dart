import 'package:dimigoin/routes/route.dart';
import 'package:dimigoin/themes/color_theme.dart';
import 'package:dimigoin/themes/text_theme.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class _StudentIDCardController extends GetxController {
  var name = "".obs;
  var grade = 1.obs;
  var classNum = 1.obs;
  var num = 0.obs;
  var department = "".obs;
  var birth = "2000-01-01".obs;

  var quit = false.obs;

  final DimigoinAccount _dimigoinAccount = DimigoinAccount();

  onCardDrag(DraggableDetails details) {
    if (details.offset.dy > Get.height * 0.5) {
      quit.value = true;
      Get.offNamed(DimigoinRoutes.ROOT, arguments: {"page": 4});
    }
  }

  _loadStudentInformation() async {
    await _dimigoinAccount.fetchAccountData();

    name.value = _dimigoinAccount.currentUser.name!;
    grade.value = _dimigoinAccount.currentUser.gradeNum!;
    classNum.value = _dimigoinAccount.currentUser.classNum!;

    // birth.value = _dimigoinAccount.currentUser.birthdate!;
    // num.value = _dimigoinAccount.currentUser.studentNum!;

    switch (classNum.value) {
      case 1:
        department.value = "e-비즈니스과";
        break;
      case 2:
        department.value = "디지털콘텐츠과";
        break;
      case 3:
      case 4:
        department.value = "웹프로그래밍과";
        break;
      case 5:
      case 6:
        department.value = "해킹방어과";
        break;
    }
  }

  @override
  void onInit() async {
    await _loadStudentInformation();

    super.onInit();
  }
}

class StudentIDCard extends GetView<_StudentIDCardController> {
  final _StudentIDCardController _studentIDCardController = Get.put(_StudentIDCardController());
  StudentIDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xA6000000),
      body: Obx(() => Draggable(
        axis: Axis.vertical,
        feedback: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Center(
            child: _generateIDcard()
          ),
        ),
        onDragEnd: _studentIDCardController.onCardDrag,
        childWhenDragging: const SizedBox(),
        child: _studentIDCardController.quit.value ? const SizedBox() : _generateIDcard(),
      )),
    );
  }

  Widget _generateIDcard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 320,
          decoration: const BoxDecoration(
            color: DimigoinColor.DIMI_MAGENTA,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 270,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/studentID/studentID.svg"),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "모바일 학생증",
                          style: DimigoinTextStyle.T5.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: 105,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        const SizedBox(
                          width: 30
                        ),
                        Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _studentIDCardController.name.value,
                              style: DimigoinTextStyle.T2.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _studentIDCardController.birth.value,
                              style: DimigoinTextStyle.T4.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              _studentIDCardController.department.value, // _department[_studentIDCardController.classNum.value - 1],
                              style: DimigoinTextStyle.T5.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${_studentIDCardController.grade.value}학년 ${_studentIDCardController.classNum.value}반 ${_studentIDCardController.num.value}번",
                              style: DimigoinTextStyle.T5.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 105,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 320,
          height: 174,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)
            )
          ),
          child: Center(
            child: SvgPicture.asset("assets/images/studentID/dimigo_black.svg")
          ),
        )
      ],
    );
  }
}