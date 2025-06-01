import 'package:flutter/widgets.dart';

class LoginModel {
  TextEditingController userName;
  TextEditingController userPassword;

  LoginModel()
    : userName = TextEditingController(),
      userPassword = TextEditingController();
}
