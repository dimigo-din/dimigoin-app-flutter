import 'package:dimigoin/routes/route.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

import 'package:get/get.dart';

class StudentIDController extends GetxController {
  final DimigoinAccount _dimigoinAccount = DimigoinAccount();

  logout(void Function() initializePages) async {
    await _dimigoinAccount.logout();
    Get.offAllNamed(DimigoinRoutes.AUTH, arguments: {"initializePages": () => initializePages});
  }

  openIDCard() {
    Get.offAllNamed(DimigoinRoutes.IDCARD);
  }
}