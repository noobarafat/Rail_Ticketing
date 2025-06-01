import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/models/login_model.dart';

class LoginViewmodel extends GetxController {
  LoginModel loginModel = LoginModel();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void toggleObsecure() {
    isObsecure = !isObsecure;
    update();
  }

  bool validateLoginField() {
    return loginFormKey.currentState?.validate() ?? false;
  }
}
