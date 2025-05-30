import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  List<String> items = [
    "Automatically Click",
    "I will Click",
    "Click Avalilability Button",
  ];
  int? _selectedIndex;

  void _onCheckboxChanged(int index, bool? value) {
    setState(() {
      if (value == true) {
        _selectedIndex = index;
      } else {
        _selectedIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        return CheckboxListTile(
          title: Text('Option ${index + 1}'),
          value: _selectedIndex == index,
          onChanged: (value) => _onCheckboxChanged(index, value),
        );
      }),
    );
  }
}
