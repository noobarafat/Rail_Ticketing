import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/viewmodels/child_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/gst_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/journey_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/login_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/miscellaneous_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/passenger_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/payment_method_viewmodel.dart';

import 'package:rail_ticketing/views/pages/form_input_page.dart';
import 'package:rail_ticketing/views/widgets/custom_gradient_button.dart';
import 'package:rail_ticketing/views/widgets/gradient_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _loginViewModel = Get.put(LoginViewmodel());
  final _journeyDetailsViewModel = Get.put(JourneyDetailsViewmodel());
  final _passengerDetailsViewModel = Get.put(PassengerDetailsViewmodel());
  final _childDetailsViewModel = Get.put(ChildDetailsViewmodel());
  final _gstViewModel = Get.put(GstViewmodel());
  final _miscellinous = Get.put(MiscellaneousViewmodel());
  final _paymentDetailsViewModel = Get.put(PaymentMethodViewmodel());

  final TextEditingController _formNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ticket Booking",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.square_grid_2x2_fill),
                const Padding(padding: EdgeInsets.only(right: 12)),
                Text(
                  "Forms",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            GradientContainer(),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorPallet.themeColor,
                ),
                alignment: Alignment.center,
                child: CustomGradientButton(
                  buttonName: "New Form",
                  buttonHeight: screenHeight * .05,
                  buttonWidth: screenWidth * .4,
                  onPressed: () {
                    _onPressedNewFormButton(context, screenHeight, screenWidth);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressedNewFormButton(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Form(
            key: _formKey,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "Form Name",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              content: TextFormField(
                controller: _formNameController,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty == true) {
                    return "Form name required";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  filled: false,
                ),
              ),
              actions: [
                Center(
                  child: CustomGradientButton(
                    buttonName: "Submit",
                    buttonHeight: screenHeight * .05,
                    buttonWidth: screenWidth * .5,
                    onPressed: _onPressedSubmit,
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _onPressedSubmit() {
    if (_formKey.currentState!.validate()) {
      Get.to(
        () => FormInputPage(
          formName: _formNameController.text.trim(),
          loginViewModel: _loginViewModel,
          childDetailsViewmodel: _childDetailsViewModel,
          journeyDetailsViewmodel: _journeyDetailsViewModel,
          passengerDetailsViewmodel: _passengerDetailsViewModel,
          miscellaneousViewmodel: _miscellinous,
        ),
      );
    }
  }
}
