import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rail_ticketing/models/journey_details_model.dart';

class JourneyDetailsViewmodel extends GetxController {
  GlobalKey<FormState> journeyDetailsFormKey = GlobalKey<FormState>();
  JourneyDetailsModel journeyDetails = JourneyDetailsModel();

  void updateDate(DateTime? date) {
    journeyDetails.journyDate = date;
    update();
  }

  final TextEditingController dateController = TextEditingController();

  Future<void> pickDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (newDate != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(newDate);
      updateDate(newDate);
    }
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

  void chooseClass(String? s) {
    if (s != null) {
      journeyDetails.journeyClass = s;
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

  void chooseQuota(String? s) {
    if (s != null) {
      journeyDetails.journeyQuota = s;
    }
    update();
  }

  List<String> checkBoxItems = [
    "Automatically Click AVAILABILITY button at 8:00 AM",
    "I will Click AVAILABILITY button manually",
    "Click AVAILABILITY button as soon as the page loads",
  ];
  int selectedIndexChekcBox = 0;

  void chooseIndex(int? idx) {
    if (idx != null) {
      selectedIndexChekcBox = idx;
      journeyDetails.selectedAvialibility =
          checkBoxItems[selectedIndexChekcBox];
    }
    update();
  }

  bool validateJourneyDetails() {
    bool valid = journeyDetailsFormKey.currentState?.validate() ?? false;

    if (journeyDetails.journyDate == null || !valid) {
      return false;
    } else {
      return true;
    }
  }
}
