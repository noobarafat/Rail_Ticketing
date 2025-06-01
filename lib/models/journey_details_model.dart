import 'package:flutter/material.dart';

class JourneyDetailsModel {
  TextEditingController journeyFrom;
  TextEditingController journeyTo;
  DateTime? journyDate;
  String journeyClass = "EA";
  String journeyQuota = "General";
  int? trainNo;
  TextEditingController? boradingStation;
  String selectedAvialibility =
      "Automatically Click AVAILABILITY button at 8:00 AM";

  JourneyDetailsModel()
    : journeyFrom = TextEditingController(),
      journeyTo = TextEditingController();
}
