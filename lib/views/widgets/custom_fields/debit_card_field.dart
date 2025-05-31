import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          ],
        );
      },
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
}
