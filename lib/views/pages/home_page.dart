import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/views/pages/form_input_page.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _formNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: CustomGradientButton(
          buttonName: "New Form",
          buttonHeight: screenHeight * .05,
          buttonWidth: screenWidth * .4,
          onPressed: () {
            _onPressedNewFormButton(context, screenHeight, screenWidth);
          },
        ),
      ),
    );
  }

  void _onPressedNewFormButton(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Form(
            key: _formKey,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "Form Name",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              content: TextFormField(
                controller: _formNameController,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty == true) {
                    return "Form name required";
                  } else {
                    return null;
                  }
                },
              ),
              actions: [
                Center(
                  child: CustomGradientButton(
                    buttonName: "Submit",
                    buttonHeight: screenHeight * .05,
                    buttonWidth: screenWidth * .5,
                    onPressed: _onPressedSubmit,
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _onPressedSubmit() {
    if (_formKey.currentState!.validate()) {
      Get.to(() => FormInputPage(formName: _formNameController.text.trim()));
    }
  }
}
