import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';

import 'package:rail_ticketing/views/pages/home_page.dart';

class RailTicket extends StatelessWidget {
  const RailTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkTheme(),

      home: HomePage(),
    );
  }

  ThemeData _darkTheme() => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPallet.backGroundColor,
    appBarTheme: AppBarTheme(color: ColorPallet.themeColor),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorPallet.themeColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  );
}
