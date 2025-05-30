import 'package:flutter/material.dart';

class FormInputPage extends StatefulWidget {
  const FormInputPage({super.key, required this.formName});

  final String formName;

  @override
  State<FormInputPage> createState() => _FormInputPageState();
}

class _FormInputPageState extends State<FormInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.formName),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
