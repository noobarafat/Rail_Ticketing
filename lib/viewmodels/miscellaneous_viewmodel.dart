import 'package:get/get.dart';

class MiscellaneousViewmodel extends GetxController {
  List<Map<String, bool>> firstCheckBoxData = [
    {"Consider Auto upgradation": false},
    {"Book only if confirm berths are allotted": false},
  ];

  bool firstCheck = false;
  void toggleFirstChck() {
    firstCheck = !firstCheck;
    update();
  }

  bool secondCheck = false;
  void toggleSecondCheck() {
    secondCheck = !secondCheck;
    update();
  }

  List<String> travelInsurance = ["Yes", "No"];
  List<String> bookingOptions = [
    "None",
    "Book, only if all berths are allotted in same coach",
    "Book, only if at least 1 lower berths is allotted",
    "Book, only if 2 lower berths is allotted",
  ];

  int selectedIndexChekcBox = 0;

  void chooseIndex(int? idx) {
    if (idx != null) {
      selectedIndexChekcBox = idx;
    }
    update();
  }

  int yesNoIndex = 0;
  void chooseYesNoIndex(int? idx) {
    if (idx != null) {
      yesNoIndex = idx;
    }
    update();
  }

  bool isCoachPreferred = false;

  void toggleIsCoacPrferred() {
    isCoachPreferred = !isCoachPreferred;
    update();
  }

  List<String> paymentDropdown = [
    "Pay through Debit / Credit / Net Banking / Wallets / ...",
    "Pay thorugh BHIM / UPI",
  ];

  String selectedPayment =
      "Pay through Debit / Credit / Net Banking / Wallets / ...";

  bool isAutoFilCapcha = false;
  void toggleAutoFillCap() {
    isAutoFilCapcha = !isAutoFilCapcha;
    update();
  }
}
