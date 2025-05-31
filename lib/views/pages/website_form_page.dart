import 'package:flutter/material.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/child_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/debit_card_field.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/journey_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/login_field.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/passenger_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/payment_field.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';

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
              _sectionHeader(context, "Passenger Details"),
              PassengerDetails(),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Child Details"),
              Padding(padding: EdgeInsets.only(top: 16)),
              ChildDetails(),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Payment Method"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: PaymentField()),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Debit Card with PIN"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: DebitCardField()),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomGradientButton(
                buttonName: "Book Now",
                buttonHeight: 40,
                buttonWidth: double.maxFinite,
                onPressed: () {},
              ),
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
