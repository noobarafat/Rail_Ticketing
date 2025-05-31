import 'package:flutter/material.dart';

class ChildDetailsModel {
  TextEditingController childNameController;
  String childAge = "Below one year";
  String childGender = "Male";

  ChildDetailsModel() : childNameController = TextEditingController();
}
