import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/viewmodels/miscellaneous_viewmodel.dart';

class CustomRadioCheckBoxes extends StatelessWidget {
  CustomRadioCheckBoxes({super.key});

  final controller = Get.find<MiscellaneousViewmodel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MiscellaneousViewmodel>(
      builder: (_) {
        return Column(
          children: List.generate(controller.bookingOptions.length, (index) {
            return RadioListTile(
              activeColor: ColorPallet.gradientColor1,
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                controller.bookingOptions[index],
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: index,
              groupValue: controller.selectedIndexChekcBox,
              onChanged: (index) {
                controller.chooseIndex(index);
              },
            );
          }),
        );
      },
    );
  }
}
