import 'package:flutter/material.dart';

class ChildDetailsModel {
  final TextEditingController childNameController;
  String childAge;
  String childGender;

  ChildDetailsModel({
    required this.childNameController,
    required this.childAge,
    required this.childGender,
  });

  factory ChildDetailsModel.newChild() {
    return ChildDetailsModel(
      childNameController: TextEditingController(),
      childAge: "Below one year",
      childGender: "Male",
    );
  }
}
