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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: Colors.red),
      ),
      hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPallet.gradientColor2,
        fixedSize: Size(double.maxFinite, 50),
        iconSize: 30,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: ColorPallet.gradientColor2,
      labelColor: Colors.yellow,
      dividerColor: Colors.transparent,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(fontSize: 12, color: Colors.red),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
