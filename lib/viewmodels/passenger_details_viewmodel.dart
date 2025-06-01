import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/models/passenger_detrails_model.dart';

class PassengerDetailsViewmodel extends GetxController {
  List<PassengerDetailsModel> passengers = [];
  List<GlobalKey<FormState>> passengerFormKey = [];

  @override
  void onInit() {
    addPassenger();
    update();
    super.onInit();
  }

  bool addPassenger() {
    if (passengers.length >= 6) {
      return false;
    }
    passengers.add(PassengerDetailsModel());
    passengerFormKey.add(GlobalKey<FormState>());
    update();

    return true;
  }

  void removeUser(int index) {
    passengers[index].passengerName.dispose();
    passengers[index].passengerAge.dispose();

    passengers.removeAt(index);
    passengerFormKey.removeAt(index);
    update();
  }

  List<String> genders = ["Male", "Female", "Transgender"];

  List<String> availableBerthPreferences = [
    "Berth Preference",
    "LOWER",
    "MIDDLE",
    "UPPER",
    "SIDE LOWER",
    "SIDE UPPER",
    "WINDOW SIDE",
    "CABIN",
    "COUPE",
  ];

  List<String> availableMeals = [
    "Select Meal",
    "VEG",
    "NON VEG",
    "JAIN MEAL",
    "VEG (DIABETIC)",
    "NON VEG (DIABETIC)",
    "NO FOOD",
  ];

  bool validatePessengerDetails() {
    bool isValid = true;
    for (int i = 0; i < passengerFormKey.length; i++) {
      bool valid = passengerFormKey[i].currentState?.validate() ?? false;
      if (!valid) {
        isValid = false;
      }
    }
    return isValid;
  }
}
