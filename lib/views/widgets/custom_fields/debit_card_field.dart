import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/viewmodels/payment_method_viewmodel.dart';

class DebitCardField extends StatelessWidget {
  DebitCardField({super.key});

  final PaymentMethodViewmodel _paymentMethodViewmodel = Get.put(
    PaymentMethodViewmodel(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodViewmodel>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bank"),
            const SizedBox(height: 10),
            _buildBankOption(controller),
            const SizedBox(height: 10),
            Text("Card Type"),
            const SizedBox(height: 10),
            _buildCardType(controller),
            const SizedBox(height: 10),
            Text("Card Number"),
            const SizedBox(height: 10),
            _buildCardNumberOption(),
            const SizedBox(height: 10),
            Text("Name On Card"),
            const SizedBox(height: 10),
            TextFormField(),
            const SizedBox(height: 10),
            Text("Expiry"),
            const SizedBox(height: 10),
            _buildExpirySection(controller, context),
            const SizedBox(height: 10),
            _buildPinCvv(controller, context),
            const SizedBox(height: 10),
            _buildCheckBox(controller),
            const SizedBox(height: 10),
            Text("Static Password (for HDFC Bank)"),
          ],
        );
      },
    );
  }

  CheckboxListTile _buildCheckBox(PaymentMethodViewmodel controller) {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.all(0),
      checkboxShape: CircleBorder(),
      side: BorderSide(color: ColorPallet.gradientColor2, width: 3),
      title: Text("Autofill Captcha & Password"),
      controlAffinity: ListTileControlAffinity.leading,
      value: controller.autoCaptchaAndPassword,
      onChanged: (val) => controller.toggle(),
    );
  }

  Widget _buildBankOption(PaymentMethodViewmodel controller) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 12),
          child: DropdownButtonFormField<String>(
            value: controller.selectedCard,

            items:
                controller.availableCardOptions
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: 14)),
                      ),
                    )
                    .toList(),
            onChanged: (val) {
              controller.chooseCard(val);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCardType(PaymentMethodViewmodel controller) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 12),
          child: DropdownButtonFormField<String>(
            value: controller.selectedCardType,
            items:
                controller.availableCardType
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: 14)),
                      ),
                    )
                    .toList(),
            onChanged: (val) {
              controller.chooseCardType(val);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCardNumberOption() {
    return Row(
      children: [
        Expanded(child: TextFormField()),
        const SizedBox(width: 10),
        Expanded(child: TextFormField()),
        const SizedBox(width: 10),
        Expanded(child: TextFormField()),
        const SizedBox(width: 10),
        Expanded(child: TextFormField()),
      ],
    );
  }

  Widget _buildExpirySection(
    PaymentMethodViewmodel controller,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .35),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: DropdownButtonFormField<String>(
                  value: controller.selectedExpiryMonths,
                  items:
                      controller.expiryMonths
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, style: TextStyle(fontSize: 14)),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseExpiryMonths(val);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: DropdownButtonFormField<String>(
                  value: controller.selectedExpiryYear,
                  items:
                      controller.expiryYears
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, style: TextStyle(fontSize: 14)),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.chooseExpiryYear(val);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinCvv(PaymentMethodViewmodel controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .35),
      child: Row(
        children: [
          Expanded(child: TextFormField()),
          const SizedBox(width: 8),
          Expanded(child: TextFormField()),
        ],
      ),
    );
  }
}
