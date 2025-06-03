import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/viewmodels/journey_details_viewmodel.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({super.key});

  final JourneyDetailsViewmodel _detailsViewmodel =
      Get.find<JourneyDetailsViewmodel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JourneyDetailsViewmodel>(
      builder: (controller) {
        return Column(
          children: List.generate(controller.checkBoxItems.length, (index) {
            return RadioListTile(
              activeColor: ColorPallet.gradientColor1,
              dense: true,
              contentPadding: EdgeInsets.all(0),
              title: Text(
                controller.checkBoxItems[index],
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
