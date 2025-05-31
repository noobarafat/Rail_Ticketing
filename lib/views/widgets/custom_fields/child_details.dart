import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/viewmodels/child_details_viewmodel.dart';
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
              itemBuilder:
                  (context, index) => Column(
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
                            TextFormField(),
                            const SizedBox(height: 10),
                            _buildAgeAndGender(controller),
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
            ElevatedButton(
              onPressed: () => _childDetailsViewmodel.addChildPassenger(),
              child: Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }

  Row _buildAgeAndGender(ChildDetailsViewmodel controller) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12),
                child: DropdownButtonFormField<String>(
                  value: controller.selectedAge,
                  items:
                      controller.availableAges
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, style: TextStyle(fontSize: 14)),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseAge(val);
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12),
                child: DropdownButtonFormField<String>(
                  value: controller.selectedGender,
                  items:
                      controller.avalilableGenders
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseGender(val);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
