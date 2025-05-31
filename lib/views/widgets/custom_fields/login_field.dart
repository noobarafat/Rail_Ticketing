import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  const LoginField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 4),
          child: Text("User Name"),
        ),
        TextFormField(),

        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 4, top: 10),
          child: Text("Password"),
        ),
        TextFormField(),
        TextButton(
          onPressed: () {},
          child: Text("No IRCTC account? Register Now"),
        ),
      ],
    );
  }
}
