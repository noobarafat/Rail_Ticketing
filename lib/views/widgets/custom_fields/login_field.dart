import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/viewmodels/login_viewmodel.dart';

class LoginField extends StatelessWidget {
  LoginField({super.key});

  final LoginViewmodel loginViewmodel = Get.put(LoginViewmodel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewmodel>(
      builder: (controller) {
        return Form(
          key: controller.loginFormKey,
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
