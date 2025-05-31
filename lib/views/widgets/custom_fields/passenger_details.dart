import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/core/country_list.dart';
import 'package:rail_ticketing/viewmodels/passenger_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class PassengerDetails extends StatelessWidget {
  PassengerDetails({super.key});
  final PassengerDetailsViewmodel passengerViewmodel = Get.put(
    PassengerDetailsViewmodel(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerDetailsViewmodel>(
      builder: (controller) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: passengerViewmodel.passengers.length,
              itemBuilder: (context, index) {
                final pessenger = passengerViewmodel.passengers[index];
                // return Card(

                //   margin: EdgeInsets.symmetric(vertical: 8),
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           children: [
                //             Text(
                //               "Passenger: ${index + 1}",
                //               style: TextStyle(fontWeight: FontWeight.bold),
                //             ),
                //             Spacer(),
                //             IconButton(
                //               icon: Icon(Icons.delete),
                //               onPressed:
                //                   () => passengerViewmodel.removeUser(index),
                //             ),
                //           ],
                //         ),
                //         TextFormField(
                //           controller: user.nameController,
                //           decoration: InputDecoration(labelText: 'Name'),
                //         ),
                //         SizedBox(height: 8),
                //         TextFormField(
                //           controller: user.ageController,
                //           keyboardType: TextInputType.number,
                //           decoration: InputDecoration(labelText: 'Age'),
                //         ),
                //       ],
                //     ),
                //   ),
                // );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        passengerViewmodel.removeUser(index);
                      },
                      icon: Icon(
                        Icons.clear,
                        color: ColorPallet.gradientColor2,
                      ),
                    ),
                    CustomTextFieldBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNameAgeRow(),
                          const SizedBox(height: 10),
                          _buildBerthAndGender(controller),
                          const SizedBox(height: 10),
                          _buildBerthPreferenceAndMealSection(controller),
                          const SizedBox(height: 10),
                          _buildAvailAndBed(),
                          const SizedBox(height: 10),
                          _buildCountryField(controller),
                          const SizedBox(height: 10),
                          _buildPassportCardNumberSection(),
                          Padding(padding: EdgeInsets.only(bottom: 8)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () => passengerViewmodel.addPassenger(),
              child: Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }

  Row _buildNameAgeRow() {
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
              TextFormField(),
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
              TextFormField(),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildBerthAndGender(PassengerDetailsViewmodel controller) {
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
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12),
                child: DropdownButtonFormField<String>(
                  value: controller.selectedGender,
                  items:
                      controller.genders
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseGender(val);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryField(PassengerDetailsViewmodel controller) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 12),
          child: DropdownButtonFormField<String>(
            value: controller.selectedCountry,
            items:
                CountryList.countries
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: (val) {
              controller.chooseCountry(val);
            },
          ),
        ),
      ),
    );
  }

  Row _buildBerthPreferenceAndMealSection(
    PassengerDetailsViewmodel controller,
  ) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12),
                child: DropdownButtonFormField<String>(
                  value: controller.selectedBerthPref,
                  items:
                      controller.availableBerthPreferences
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, style: TextStyle(fontSize: 10)),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseBerthPref(val);
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12),
                child: DropdownButtonFormField<String>(
                  value: controller.selectedMeal,
                  items:
                      controller.availableMeals
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, style: TextStyle(fontSize: 10)),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseMeal(val);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildAvailAndBed() {
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

  Row _buildPassportCardNumberSection() {
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
          child: TextFormField(
            decoration: InputDecoration(hintText: "Card Number"),
          ),
        ),
      ],
    );
  }
}
