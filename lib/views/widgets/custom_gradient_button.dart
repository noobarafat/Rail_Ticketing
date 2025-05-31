import 'dart:async';
import 'package:flutter/material.dart';

import 'package:rail_ticketing/core/color_pallet.dart';

class CustomGradientButton extends StatefulWidget {
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
  State<CustomGradientButton> createState() => _CustomGradientButtonState();
}

class _CustomGradientButtonState extends State<CustomGradientButton> {
  bool isTapped = false;

  void onTapInkWell() {
    setState(() {
      isTapped = true;
    });
    Timer(Duration(milliseconds: 200), () {
      setState(() {
        isTapped = false;
      });
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: onTapInkWell,
      child: AnimatedContainer(
        duration: Duration(microseconds: 200),
        height: widget.buttonHeight,
        width: widget.buttonWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorPallet.gradientColor1, ColorPallet.gradientColor2],
            begin: isTapped ? Alignment.bottomCenter : Alignment.topCenter,
            end: isTapped ? Alignment.topCenter : Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.buttonName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.buttonName == "+" ? 28 : 16,
          ),
        ),
      ),
    );
  }
}
