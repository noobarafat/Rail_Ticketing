import 'package:flutter/material.dart';

class PassengerDetailsModel {
  TextEditingController passengerName;
  TextEditingController passengerAge;
  TextEditingController phoneNumber;

  String passengerGender;
  String passengerBerthPref;
  String passengerMeal;
  String passengerCountry;

  TextEditingController? passengerCardNumner;
  // String? passportOrTravelDoc;

  // String? optBerth;
  // String? availConsession;
  // String? bedRoll;

  PassengerDetailsModel({
    required this.passengerName,
    required this.passengerAge,
    required this.phoneNumber,
    this.passengerGender = "Male",
    this.passengerBerthPref = "Berth Preference",
    this.passengerMeal = "Select Meal",
    this.passengerCountry = "India",
  });

  factory PassengerDetailsModel.newPassenger() {
    return PassengerDetailsModel(
      passengerName: TextEditingController(),
      passengerAge: TextEditingController(),
      phoneNumber: TextEditingController(),
    );
  }
}
