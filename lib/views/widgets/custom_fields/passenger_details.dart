import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/viewmodels/passenger_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/text_field_box.dart';

class PassengerDetails extends StatelessWidget {
  PassengerDetails({super.key});
  final PassengerViewmodel passengerViewmodel = Get.put(PassengerViewmodel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerViewmodel>(
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
                      icon: Icon(Icons.delete),
                    ),
                    CustomTextFieldBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNameAgeRow(),
                          _buildPassengerFields("Opt Beth", "Male"),
                          _buildPassengerFields("Berth Pref", "Select Meal"),
                          _buildPassengerFields(
                            "Avalil Consession",
                            "Bed Roll",
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 8)),
                          TextField(
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () => passengerViewmodel.addUser(),
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
                padding: const EdgeInsets.only(left: 12),
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
                padding: const EdgeInsets.only(left: 12),
                child: Text("Age"),
              ),
              TextFormField(),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildPassengerFields(String name1, String name2) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(name1),
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
                padding: const EdgeInsets.only(left: 12),
                child: Text(name2),
              ),
              TextFormField(),
            ],
          ),
        ),
      ],
    );
  }
}
