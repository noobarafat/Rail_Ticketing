import 'package:flutter/material.dart';
import 'package:rail_ticketing/core/color_pallet.dart';

class CustomTextFieldBox extends StatelessWidget {
  const CustomTextFieldBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorPallet.gradientColor2, ColorPallet.gradientColor1],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: null,
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
