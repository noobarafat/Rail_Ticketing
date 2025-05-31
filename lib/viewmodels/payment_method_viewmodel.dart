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
}
