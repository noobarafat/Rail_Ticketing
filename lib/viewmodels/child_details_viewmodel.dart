import 'package:get/get.dart';
import 'package:rail_ticketing/models/child_details_model.dart';

class ChildDetailsViewmodel extends GetxController {
  List<ChildDetailsModel> childPessengers = [];

  void addChildPassenger() {
    childPessengers.add(ChildDetailsModel());
    update();
  }

  void removeChildPassenger(int index) {
    childPessengers.removeAt(index);
    update();
  }

  List<String> availableAges = [
    "Below one year",
    "One year",
    "Two year",
    "Three year",
    "Four year",
  ];
  String selectedAge = "Below one year";
  void chooseAge(String? age) {
    if (age != null) {
      selectedAge = age;
    }
    update();
  }

  List<String> avalilableGenders = ["Male", "Female", "Transgender"];
  String selectedGender = "Male";
  void chooseGender(String? gender) {
    if (gender != null) {
      selectedGender = gender;
    }
    update();
  }
}
