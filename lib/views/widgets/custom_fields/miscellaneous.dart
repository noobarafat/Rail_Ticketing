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
              visualDensity: VisualDensity(vertical: -4),
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
              visualDensity: VisualDensity(vertical: -4),
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
              padding: const EdgeInsets.only(left: 10, bottom: 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Travel Insurence",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...List.generate(
                    2,
                    (index) => Expanded(
                      flex: 1,
                      child: RadioListTile(
                        visualDensity: VisualDensity(vertical: -4),
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
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 4),
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
                "Coach Preferred",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Coach Id",
                      enabled: controller.isCoachPreferred,
                      fillColor:
                          !controller.isCoachPreferred
                              ? Colors.grey.shade800
                              : null,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            const SizedBox(height: 16),
            _buildTitle("Mobile No"),
            Row(
              children: [
                Expanded(child: TextFormField()),
                Expanded(child: Text("")),
              ],
            ),
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
            const SizedBox(height: 10),
            CheckboxListTile.adaptive(
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.all(0),
              value: controller.isAutoFilCapcha,
              onChanged: (val) {
                controller.toggleAutoFillCap();
              },
              title: Text(
                "Autofill Captchas",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
