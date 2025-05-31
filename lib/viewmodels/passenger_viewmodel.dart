import 'package:get/get.dart';
import 'package:rail_ticketing/core/country_list.dart';
import 'package:rail_ticketing/models/passenger_model.dart';

class PassengerDetailsViewmodel extends GetxController {
  List<PassengerModel> passengers = [];

  @override
  void onInit() {
    addUser();
    update();
    super.onInit();
  }

  void addUser() {
    passengers.add(PassengerModel());
    update();
  }

  void removeUser(int index) {
    passengers[index].nameController.dispose();
    passengers[index].ageController.dispose();
    passengers.removeAt(index);
    update();
  }

  List<String> genders = ["Male", "Female", "Transgender"];
  String selectedGender = "Male";
  void chooseGender(String? gender) {
    if (gender != null) {
      selectedGender = gender;
    }
    update();
  }

  String selectedCountry = CountryList.countries[0];
  void chooseCountry(String? country) {
    if (country != null) {
      selectedCountry = country;
    }
    update();
  }

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
  String selectedBerthPref = "Berth Preference";
  void chooseBerthPref(String? berth) {
    if (berth != null) {
      selectedBerthPref = berth;
    }
    update();
  }

  List<String> availableMeals = [
    "Select Meal",
    "VEG",
    "NON VEG",
    "JAIN MEAL",
    "VEG (DIABETIC)",
    "NON VEG (DIABETIC)",
    "NO FOOD",
  ];
  String selectedMeal = "Select Meal";
  void chooseMeal(String? meal) {
    if (meal != null) {
      selectedMeal = meal;
    }
    update();
  }
}
