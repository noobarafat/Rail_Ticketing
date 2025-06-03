import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/core/country_list.dart';
import 'package:rail_ticketing/models/passenger_detrails_model.dart';
import 'package:rail_ticketing/viewmodels/passenger_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';
import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class PassengerDetails extends StatelessWidget {
  const PassengerDetails({
    super.key,
    required this.controller,
    required this.formKey,
    required this.onAddPassenger,
    required this.onRemovePassenger,
  });

  final PassengerDetailsViewmodel controller;
  final List<GlobalKey<FormState>> formKey;
  final VoidCallback onAddPassenger;
  final void Function(int) onRemovePassenger;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerDetailsViewmodel>(
      builder: (_) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.passengers.length,
              itemBuilder: (context, index) {
                final passenger = controller.passengers[index];

                return Form(
                  key: formKey[index],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => onRemovePassenger(index),
                        icon: Icon(
                          Icons.clear,
                          color: ColorPallet.gradientColor2,
                        ),
                      ),

                      CustomTextFieldBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildNameAgeRow(passenger),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                bottom: 6,
                              ),
                              child: Text("Phone Number"),
                            ),
                            TextFormField(
                              controller: passenger.phoneNumber,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Phone Number required";
                                } else {
                                  null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            _buildBerthAndGender(controller, passenger),
                            const SizedBox(height: 10),
                            _buildBerthPreference(controller, passenger),
                            const SizedBox(height: 10),
                            _buildMealSection(controller, passenger),
                            const SizedBox(height: 10),
                            _buildAvailAndBed(),
                            const SizedBox(height: 10),
                            _buildCountryField(controller, passenger),
                            const SizedBox(height: 10),
                            passenger.passengerCountry != "India"
                                ? _buildPassportCardNumberSection(passenger)
                                : SizedBox(height: 0),
                            Padding(padding: EdgeInsets.only(bottom: 4)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            CustomGradientButton(
              buttonName: "+",
              buttonHeight: 40,
              buttonWidth: double.maxFinite,
              onPressed: onAddPassenger,
            ),
          ],
        );
      },
    );
  }

  Row _buildNameAgeRow(PassengerDetailsModel passenger) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 6),
                child: Text("Name"),
              ),
              TextFormField(
                controller: passenger.passengerName,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name required";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 6),
                child: Text("Age"),
              ),
              TextFormField(
                controller: passenger.passengerAge,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Age required";
                  } else if (int.tryParse(value) == null) {
                    return "Enter correct age";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildBerthAndGender(
    PassengerDetailsViewmodel controller,
    PassengerDetailsModel passenger,
  ) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              fillColor: ColorPallet.gradientColor1.withAlpha(36),
              hintText: "Opt Berth",
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: DropdownButtonFormField<String>(
            value: passenger.passengerGender,
            items:
                controller.genders
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: (val) {
              if (val != null) {
                passenger.passengerGender = val;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCountryField(
    PassengerDetailsViewmodel controller,
    PassengerDetailsModel passenger,
  ) {
    return DropdownButtonFormField<String>(
      value: passenger.passengerCountry,
      items:
          CountryList.countries
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
      onChanged: (val) {
        if (val != null) {
          passenger.passengerCountry = val;
          controller.update();
        }
      },
    );
  }

  Widget _buildBerthPreference(
    PassengerDetailsViewmodel controller,
    PassengerDetailsModel passenger,
  ) {
    return DropdownButtonFormField<String>(
      value: passenger.passengerBerthPref,
      items:
          controller.availableBerthPreferences
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
      onChanged: (val) {
        if (val != null) {
          passenger.passengerBerthPref = val;
        }
      },
    );
  }

  Widget _buildMealSection(
    PassengerDetailsViewmodel controller,
    PassengerDetailsModel passenger,
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(),
      value: passenger.passengerMeal,
      items:
          controller.availableMeals
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
      onChanged: (val) {
        if (val != null) {
          passenger.passengerMeal = val;
        }
      },
    );
  }

  Widget _buildAvailAndBed() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              fillColor: ColorPallet.gradientColor1.withAlpha(36),
              hintText: "Avail Concession",
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              //fillColor: ColorPallet.gradientColor1.withAlpha(36),
              hintText: "Bed Roll",
              suffixIcon: Icon(Icons.square),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildPassportCardNumberSection(PassengerDetailsModel passenger) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              fillColor: ColorPallet.gradientColor1.withAlpha(36),
              hintText: "Passport/Travel document",
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Flexible(
          flex: 1,
          child: TextField(
            controller: passenger.passengerCardNumner,
            decoration: InputDecoration(hintText: "Card Number"),
          ),
        ),
      ],
    );
  }
}
