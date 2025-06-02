import 'package:flutter/widgets.dart';

class LoginModel {
  final TextEditingController userName;
  final TextEditingController userPassword;

  LoginModel()
    : userName = TextEditingController(),
      userPassword = TextEditingController();
}
