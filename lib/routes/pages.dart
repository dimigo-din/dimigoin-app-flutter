import 'package:dimigoin/pages/auth/page.dart';
import 'package:dimigoin/pages/home/page.dart';
import 'package:dimigoin/pages/schedule/page.dart';
import 'package:dimigoin/pages/studentID/widgets/studentID.dart';
import 'package:dimigoin/routes/route.dart';
import 'package:dimigoin/utils/root.dart';
import 'package:get/get.dart';

class DimigoinPages {
  static final pages = [
    GetPage(name: DimigoinRoutes.ROOT, page: () => Root()),
    GetPage(name: DimigoinRoutes.AUTH, page: () => Auth()),
    GetPage(name: DimigoinRoutes.HOME, page: () => HomePage()),
    GetPage(name: DimigoinRoutes.MEAL, page: () => SchedulePage()),
    GetPage(
      name: DimigoinRoutes.IDCARD, 
      page: () => StudentIDCard(), 
      transition: Transition.downToUp, 
      transitionDuration: const Duration(milliseconds: 200)
    )
  ];
}