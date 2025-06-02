import 'package:get/get.dart';
import 'package:rail_ticketing/models/child_details_model.dart';

class ChildDetailsViewmodel extends GetxController {
  List<ChildDetailsModel> childPessengers = [];

  bool addChildPassenger() {
    if (childPessengers.length >= 2) {
      return false;
    }
    childPessengers.add(ChildDetailsModel.newChild());
    update();
    return true;
  }

  void removeChildPassenger(int index) {
    if (childPessengers.isNotEmpty) {
      childPessengers.removeAt(index);
    }
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
}
