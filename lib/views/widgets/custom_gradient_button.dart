import 'package:flutter/material.dart';
import 'package:rail_ticketing/core/color_pallet.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.buttonName,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.onPressed,
  });

  final String buttonName;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorPallet.gradientColor1, ColorPallet.gradientColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        alignment: Alignment.center,
        child: Text(buttonName, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
