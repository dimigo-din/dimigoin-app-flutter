import 'package:dimigoin/pages/home/page.dart';
import 'package:dimigoin/routes/route.dart';
import 'package:get/get.dart';

class DimigoinPages {
  static final pages = [
    GetPage(name: DimigoinRoutes.HOME, page: () => HomePage())
  ];
}