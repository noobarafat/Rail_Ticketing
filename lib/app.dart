//app.dart

import 'package:flutter/material.dart';

import 'package:rail_ticketing/views/pages/home_page.dart';

class RailTicket extends StatelessWidget {
  const RailTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
