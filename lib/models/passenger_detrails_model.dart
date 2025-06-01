import 'package:flutter/material.dart';

class PassengerDetailsModel {
  TextEditingController passengerName;
  TextEditingController passengerAge;

  String passengerGender = "Male";
  String passengerBerthPref = "Berth Preference";
  String passengerMeal = "Select Meal";
  String passengerCountry = "India";

  TextEditingController? passengerCardNumner;
  // String? passportOrTravelDoc;

  // String? optBerth;
  // String? availConsession;
  // String? bedRoll;

  PassengerDetailsModel()
    : passengerName = TextEditingController(),
      passengerAge = TextEditingController();
}
