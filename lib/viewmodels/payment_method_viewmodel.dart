import 'package:get/get.dart';

class PaymentMethodViewmodel extends GetxController {
  List<String> availablePaymentMethods = [
    "IRCTC iPay (Credit Card/Debit Card/UPI)",
    "Net Banking",
    "Wallets / Cash Card",
    "Multiple Payment Service",
    "IRCTC eWallet",
    "Payment Gateway / Credit Card / Debit Card",
  ];

  int selectedPaymentMethodIndex = 5;
  void chooseIndex(int? index) {
    if (index != null) {
      selectedPaymentMethodIndex = index;
    }
    update();
  }

  List<String> availableCardOptions = [
    "Visa/Master Card(Powred By HDFC BANK)",
    "Visa/Master Card(Powred By ICICI BANK)",
    "American Express",
  ];
  String selectedCard = "Visa/Master Card(Powred By HDFC BANK)";
  void chooseCard(String? card) {
    if (card != null) {
      selectedCard = card;
    }
    update();
  }

  List<String> availableCardType = ["Master Card", "VISA", "RuPay"];
  String selectedCardType = "Master Card";
  void chooseCardType(String? card) {
    if (card != null) {
      selectedCardType = card;
    }
    update();
  }

  List<String> expiryMonths = [
    "Month",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  List<String> expiryYears = [
    "Year",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031",
    "2032",
    "2033",
    "2034",
    "2035",
  ];

  String selectedExpiryMonths = "Month";
  String selectedExpiryYear = "Year";

  void chooseExpiryMonths(String? month) {
    if (month != null) {
      selectedExpiryMonths = month;
    }
    update();
  }

  void chooseExpiryYear(String? year) {
    if (year != null) {
      selectedExpiryYear = year;
    }
    update();
  }

  bool autoCaptchaAndPassword = false;
  void toggle() {
    autoCaptchaAndPassword = !autoCaptchaAndPassword;
    update();
  }
}
