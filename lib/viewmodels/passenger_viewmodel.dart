import 'package:get/get.dart';
import 'package:rail_ticketing/models/passenger_model.dart';

class PassengerViewmodel extends GetxController {
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
}
