import 'package:get/get.dart';

import 'package:rail_ticketing/models/passenger_detrails_model.dart';

class PassengerDetailsViewmodel extends GetxController {
  List<PassengerDetailsModel> passengers = [
    PassengerDetailsModel.newPassenger(),
  ];

  bool addPassenger() {
    if (passengers.length >= 6) {
      return false;
    }
    passengers.add(PassengerDetailsModel.newPassenger());
    update();

    return true;
  }

  void removeUser(int index) {
    if (passengers.isNotEmpty) {
      passengers.removeAt(index);
    }
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
}
