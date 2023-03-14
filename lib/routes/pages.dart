import 'package:dimigoin/pages/auth/page.dart';
import 'package:dimigoin/pages/home/page.dart';
import 'package:dimigoin/pages/schedule/page.dart';
import 'package:dimigoin/routes/route.dart';
import 'package:get/get.dart';

class DimigoinPages {
  static final pages = [
    GetPage(name: DimigoinRoutes.AUTH, page: () => Auth()),
    GetPage(name: DimigoinRoutes.HOME, page: () => HomePage()),
    GetPage(name: DimigoinRoutes.MEAL, page: () => SchedulePage())
  ];
}