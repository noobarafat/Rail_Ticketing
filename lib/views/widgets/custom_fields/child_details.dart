import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/models/child_details_model.dart';
import 'package:rail_ticketing/viewmodels/child_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';
import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class ChildDetails extends StatelessWidget {
  ChildDetails({super.key});

  final ChildDetailsViewmodel _childDetailsViewmodel = Get.put(
    ChildDetailsViewmodel(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildDetailsViewmodel>(
      builder: (controller) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemCount: controller.childPessengers.length,
              itemBuilder: (context, index) {
                var childPassenger = controller.childPessengers[index];

                return Form(
                  key: controller.childFormKeys[index],
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
              onPressed: () => _childDetailsViewmodel.addChildPassenger(),
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
