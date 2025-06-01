import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/models/child_details_model.dart';

class ChildDetailsViewmodel extends GetxController {
  List<ChildDetailsModel> childPessengers = [];
  List<GlobalKey<FormState>> childFormKeys = [];

  bool addChildPassenger() {
    if (childPessengers.length >= 2) {
      return false;
    }
    childPessengers.add(ChildDetailsModel());
    childFormKeys.add(GlobalKey<FormState>());
    update();
    return true;
  }

  void removeChildPassenger(int index) {
    childPessengers[index].childNameController.dispose();

    childPessengers.removeAt(index);
    childFormKeys.removeAt(index);

    update();
  }

  List<String> availableAges = [
    "Below one year",
    "One year",
    "Two year",
    "Three year",
    "Four year",
  ];
  List<String> avalilableGenders = ["Male", "Female", "Transgender"];

  bool validateChildDetails() {
    bool isValid = true;

    for (int i = 0; i < childFormKeys.length; i++) {
      var valid = childFormKeys[i].currentState?.validate() ?? false;
      if (!valid) {
        isValid = false;
      }
    }
    return isValid;
  }

  List<Map<String, String>> childPassengerDataList = [];
  void collectDate() {
    childPassengerDataList =
        childPessengers
            .map(
              (child) => {
                'name': child.childNameController.text.trim(),
                'age': child.childAge,
                'gender': child.childGender,
              },
            )
            .toList();

    print(childPassengerDataList);
  }
}
