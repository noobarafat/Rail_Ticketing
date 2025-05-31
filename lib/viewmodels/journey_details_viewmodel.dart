import 'package:get/get.dart';

class JourneyDetailsViewmodel extends GetxController {
  DateTime? selectedDate;

  void updateDate(DateTime? date) {
    selectedDate = date;
    print(selectedDate);
    update();
  }

  final List<String> availableClass = [
    "EA",
    "1A",
    "2A",
    "3A",
    "CC",
    "3E",
    "EC",
    "SL",
    "FC",
    "2S",
    "VS",
    "VC",
    "EV",
  ];

  String selectedClass = "EA";

  void chooseClass(String? s) {
    if (s != null) {
      selectedClass = s;
    }
    update();
  }

  final List<String> availableQuota = [
    "General",
    "Tatkal",
    "Premium Tatkal",
    "Physically Handicapped",
    "Duty Pass",
    "Ladies",
    "Lower Berth",
  ];

  String selectedQuota = "General";

  void chooseQuota(String? s) {
    if (s != null) {
      selectedQuota = s;
    }
    update();
  }

  List<String> checkBoxItems = [
    "Automatically Click AVAILABILITY button at 8:00 AM",
    "I will Click AVAILABILITY button manually",
    "Click AVAILABILITY button as soon as the page loads",
  ];
  int? selectedIndexChekcBox;

  void chooseIndex(int? idx) {
    selectedIndexChekcBox = idx;
    update();
  }
}
