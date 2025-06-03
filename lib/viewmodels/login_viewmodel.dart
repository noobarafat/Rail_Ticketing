import 'package:get/get.dart';
import 'package:rail_ticketing/models/login_model.dart';

class LoginViewmodel extends GetxController {
  LoginModel loginModel = LoginModel();
  bool isObsecure = true;

  void toggleObsecure() {
    isObsecure = !isObsecure;
    update();
  }

  Map<String, dynamic> getLoginData() {
    return {
      'userName': loginModel.userName.text.trim(),
      'password': loginModel.userPassword.text,
    };
  }
}
