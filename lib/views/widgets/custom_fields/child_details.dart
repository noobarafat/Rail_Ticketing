import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/models/child_details_model.dart';
import 'package:rail_ticketing/viewmodels/child_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';
import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class ChildDetails extends StatelessWidget {
  const ChildDetails({super.key, required this.controller});

  final ChildDetailsViewmodel controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildDetailsViewmodel>(
      builder: (_) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemCount: controller.childPessengers.length,
              itemBuilder: (context, index) {
                final formKey = List.generate(
                  controller.childPessengers.length,
                  (_) => GlobalKey<FormState>(),
                );
                var childPassenger = controller.childPessengers[index];

                return Form(
                  key: formKey[index],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.removeChildPassenger(index);
                        },
                        icon: Icon(
                          Icons.clear,
                          color: ColorPallet.gradientColor2,
                        ),
                      ),
                      CustomTextFieldBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: childPassenger.childNameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Child Name required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            _buildAgeAndGender(childPassenger, controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            CustomGradientButton(
              buttonName: "+",
              buttonHeight: 40,
              buttonWidth: double.maxFinite,
              onPressed: () {
                bool successful = controller.addChildPassenger();
                if (!successful) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 800),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      content: Center(
                        child: Text("Maximum 2 children are allowed"),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  Row _buildAgeAndGender(
    ChildDetailsModel childPassenger,
    ChildDetailsViewmodel controller,
  ) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: DropdownButtonFormField<String>(
            value: childPassenger.childGender,
            items:
                controller.avalilableGenders
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: 14)),
                      ),
                    )
                    .toList(),
            onChanged: (val) {
              if (val != null) {
                childPassenger.childGender = val;
              }
            },
          ),
        ),

        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: DropdownButtonFormField<String>(
            value: childPassenger.childAge,
            items:
                controller.availableAges
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: (val) {
              if (val != null) {
                childPassenger.childAge = val;
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Select Gender";
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
