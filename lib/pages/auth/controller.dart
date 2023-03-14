import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var id = "".obs;
  var isIdEmpty = false.obs;

  var pwd = "".obs;
  var isPwdEmpty = false.obs;

  var isLoginFailed = false.obs;

  idInput(value) {
    if (value == "") {
      isIdEmpty.value = true;
      return;
    } else {
      isIdEmpty.value = false;
    }

    id.value = value;
  }

  pwdInput(value) {
    pwd.value = value;
  }

  login() async {
    DimigoinAccount dimigoinAccount = DimigoinAccount();

    var loginData = await dimigoinAccount.login(id.value, pwd.value, false);

    if (!loginData["success"]) {
      isLoginFailed.value = true;
    } else if (loginData["success"]) {
      await Get.arguments["initializePages"]();
      Get.offAllNamed("/");
    }
  }
}