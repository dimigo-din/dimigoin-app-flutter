import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

import 'package:get/get.dart';

class StudentIDController extends GetxController {
  final DimigoinAccount _dimigoinAccount = DimigoinAccount();

  logout(void Function() initializePages) async {
    await _dimigoinAccount.logout();
    Get.offAllNamed("auth", arguments: {"initializePages": () => initializePages});
  }

  openIDCard() {
    
  }
}