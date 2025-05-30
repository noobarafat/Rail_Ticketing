//...views/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          onPressed: () {},
        ),
      ),
    );
  }
}
