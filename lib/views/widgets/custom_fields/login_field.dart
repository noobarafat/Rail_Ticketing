import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/viewmodels/login_viewmodel.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.controller,
    required this.formKey,
  });

  final LoginViewmodel controller;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewmodel>(
      builder: (_) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4),
                child: Text("User Name"),
              ),
              TextFormField(
                controller: controller.loginModel.userName,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "username required";
                  } else {
                    return null;
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4, top: 10),
                child: Text("Password"),
              ),
              TextFormField(
                controller: controller.loginModel.userPassword,
                obscureText: controller.isObsecure,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "password required";
                  } else {
                    return null;
                  }
                },
              ),
              TextButton(
                onPressed: () {},
                child: Text("No IRCTC account? Register Now"),
              ),
            ],
          ),
        );
      },
    );
  }
}
