import 'package:flutter/material.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/journey_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/login_field.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/passenger_details.dart';

import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class WebsiteFormPage extends StatelessWidget {
  const WebsiteFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 12,
            right: 12,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader(context, "IRCTC Login"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: LoginField()),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Journey Details"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: JourneyDetails()),
              Padding(padding: EdgeInsets.only(top: 16)),
              PassengerDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _sectionHeader(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(name, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
