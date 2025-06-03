import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/viewmodels/miscellaneous_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_radio.dart';

class Miscellaneous extends StatelessWidget {
  const Miscellaneous({super.key, required this.controller});

  final MiscellaneousViewmodel controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MiscellaneousViewmodel>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile.adaptive(
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.all(0),
              value: controller.firstCheck,
              onChanged: (val) {
                controller.toggleFirstChck();
              },
              title: Text(
                "Consider Auto upgradation",
                style: TextStyle(fontSize: 15),
              ),
            ),
            CheckboxListTile.adaptive(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.all(0),
              dense: true,
              value: controller.secondCheck,
              onChanged: (val) {
                controller.toggleSecondCheck();
              },
              title: Text(
                "Book only if confirm berths are allotted",
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 4),
              child: Text(
                "Travel Insurence",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),
            ...List.generate(
              2,
              (index) => RadioListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                value: index,
                groupValue: controller.yesNoIndex,
                onChanged: (index) {
                  controller.chooseYesNoIndex(index);
                },
                title: index == 0 ? Text("Yes") : Text("No"),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 4),
              child: Text(
                "Booking Options",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            CustomRadioCheckBoxes(),
            const SizedBox(height: 16),
            CheckboxListTile.adaptive(
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.all(0),
              value: controller.isCoachPreferred,
              onChanged: (val) {
                controller.toggleIsCoacPrferred();
              },
              title: Text(
                "Consider Auto upgradation",
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 16),
            _buildTitle("Mobile No"),
            TextFormField(),
            const SizedBox(height: 8),
            _buildTitle("Payment"),
            DropdownButtonFormField<String>(
              value: controller.selectedPayment,
              items:
                  controller.paymentDropdown
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: TextStyle(fontSize: 14)),
                        ),
                      )
                      .toList(),
              onChanged: (val) {
                if (val != null) {
                  controller.selectedPayment = val;
                  controller.update();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Padding _buildTitle(String name) {
    return Padding(
      padding: EdgeInsets.only(left: 12, bottom: 4),
      child: Text(name),
    );
  }
}
