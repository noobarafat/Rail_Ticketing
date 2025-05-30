import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/views/pages/home_page.dart';

class RailTicket extends StatelessWidget {
  const RailTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),

      home: HomePage(),
    );
  }
}
