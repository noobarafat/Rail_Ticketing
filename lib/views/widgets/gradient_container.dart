import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rail_ticketing/core/color_pallet.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [ColorPallet.gradientColor1, ColorPallet.gradientColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 12)),
            Icon(CupertinoIcons.videocam, size: 32),
            Padding(padding: EdgeInsets.only(left: 12)),
            Text(
              "How to Book a Ticket",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
