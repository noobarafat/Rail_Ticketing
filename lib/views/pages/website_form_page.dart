import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rail_ticketing/viewmodels/child_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/journey_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/login_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/miscellaneous_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/passenger_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/child_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/debit_card_field.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/gst_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/journey_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/login_field.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/miscellaneous.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/passenger_details.dart';
import 'package:rail_ticketing/views/widgets/custom_fields/payment_field.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';
import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class WebsiteFormPage extends StatefulWidget {
  const WebsiteFormPage({
    super.key,
    required this.formName,
    required this.loginViewModel,
    required this.journeyDetailsViewmodel,
    required this.passengerDetailsViewmodel,
    required this.childDetailsViewmodel,
    required this.miscellaneousViewmodel,
  });

  final String formName;
  final LoginViewmodel loginViewModel;
  final JourneyDetailsViewmodel journeyDetailsViewmodel;
  final PassengerDetailsViewmodel passengerDetailsViewmodel;
  final ChildDetailsViewmodel childDetailsViewmodel;
  final MiscellaneousViewmodel miscellaneousViewmodel;

  @override
  State<WebsiteFormPage> createState() => _WebsiteFormPageState();
}

class _WebsiteFormPageState extends State<WebsiteFormPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _journeyDetailsKey = GlobalKey<FormState>();
  final List<GlobalKey<FormState>> _passengersKeyList = [];
  final List<GlobalKey<FormState>> _childPassengersKeyList = [];

  Future<void> submitForm(BuildContext context) async {
    bool w = _loginKey.currentState?.validate() ?? false;
    bool x = _journeyDetailsKey.currentState?.validate() ?? false;
    bool y = _childPassengersKeyList.every(
      (key) => key.currentState?.validate() ?? false,
    );
    bool z = _passengersKeyList.every(
      (key) => key.currentState?.validate() ?? false,
    );

    if (w && x && y && z) {
      widget.loginViewModel.changeSumitStatus();
      Map<String, dynamic> formData = {
        'formName': widget.formName,
        'userCredential': widget.loginViewModel.getLoginData(),
        'journeyDetails': widget.journeyDetailsViewmodel.getJourneyData(),
        'passengerDetails':
            widget.passengerDetailsViewmodel.getPassengerDetails(),
        'childDetails': widget.childDetailsViewmodel.getChildData(),
      };
      try {
        var response = await FirebaseFirestore.instance
            .collection("WebsiteForm")
            .add(formData);
        await FirebaseFirestore.instance
            .collection("ReailConnectForm")
            .add(formData);
        if (response.id.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Successfull")));
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed")));
      }
      widget.loginViewModel.changeSumitStatus();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fill all the necessary info")));
    }
  }

  void _syncChildKeys() {
    final needed = widget.childDetailsViewmodel.childPessengers.length;
    while (_childPassengersKeyList.length < needed) {
      _childPassengersKeyList.add(GlobalKey<FormState>());
    }
    while (_childPassengersKeyList.length > needed) {
      _childPassengersKeyList.removeLast();
    }
  }

  void _syncPassengerKeys() {
    final needed = widget.passengerDetailsViewmodel.passengers.length;
    while (_passengersKeyList.length < needed) {
      _passengersKeyList.add(GlobalKey<FormState>());
    }
    while (_passengersKeyList.length > needed) {
      _passengersKeyList.removeLast();
    }
  }

  void _addChild() {
    final added = widget.childDetailsViewmodel.addChildPassenger();
    if (added) {
      _childPassengersKeyList.add(GlobalKey<FormState>());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 800),
          margin: EdgeInsets.symmetric(horizontal: 40),
          content: Center(child: Text("Maximum 2 children are allowed")),
        ),
      );
    }
  }

  void _addPassenger() {
    final added = widget.passengerDetailsViewmodel.addPassenger();
    if (added) {
      _passengersKeyList.add(GlobalKey<FormState>());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 800),
          margin: EdgeInsets.symmetric(horizontal: 40),
          content: Center(child: Text("Maximum 6 passengers are allowed")),
        ),
      );
    }
  }

  void _removeChild(int index) {
    widget.childDetailsViewmodel.removeChildPassenger(index);
    _childPassengersKeyList.removeAt(index);
  }

  void _removePassenger(int index) {
    widget.passengerDetailsViewmodel.removePassenger(index);
    _passengersKeyList.removeAt(index);
  }

  @override
  void initState() {
    _syncPassengerKeys();
    _syncChildKeys();
    super.initState();
  }

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
              CustomTextFieldBox(
                child: LoginField(
                  controller: widget.loginViewModel,
                  formKey: _loginKey,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Journey Details"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(
                child: JourneyDetails(
                  controller: widget.journeyDetailsViewmodel,
                  formKey: _journeyDetailsKey,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Passenger Details"),
              PassengerDetails(
                controller: widget.passengerDetailsViewmodel,
                formKey: _passengersKeyList,
                onAddPassenger: _addPassenger,
                onRemovePassenger: _removePassenger,
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Child Details"),
              ChildDetails(
                controller: widget.childDetailsViewmodel,
                formKey: _childPassengersKeyList,
                onAddChild: _addChild,
                onRemoveChild: _removeChild,
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Gst Details (Optional)"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: GstDetails()),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Miscellaneaous"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(
                child: Miscellaneous(controller: widget.miscellaneousViewmodel),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Payment Method"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: PaymentField()),
              Padding(padding: EdgeInsets.only(top: 16)),
              _sectionHeader(context, "Debit Card with PIN"),
              Padding(padding: EdgeInsets.only(top: 16)),
              CustomTextFieldBox(child: DebitCardField()),
              Padding(padding: EdgeInsets.only(top: 16)),
              GetBuilder<LoginViewmodel>(
                builder: (_) {
                  return CustomGradientButton(
                    buttonName:
                        !widget.loginViewModel.isSubmitted
                            ? "Book Now"
                            : "...loading...",
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    onPressed: () => submitForm(context),
                  );
                },
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
