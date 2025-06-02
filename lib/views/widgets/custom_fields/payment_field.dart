import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/core/color_pallet.dart';
import 'package:rail_ticketing/viewmodels/payment_method_viewmodel.dart';

class PaymentField extends StatelessWidget {
  PaymentField({super.key});

  final PaymentMethodViewmodel _paymentMethodViewmodel =
      Get.find<PaymentMethodViewmodel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodViewmodel>(
      builder:
          (controller) => Column(
            children: [
              ...List.generate(
                controller.availablePaymentMethods.length,
                (index) => RadioListTile(
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  activeColor: ColorPallet.gradientColor1,
                  title: Text(
                    controller.availablePaymentMethods[index],
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  value: index,
                  groupValue: controller.selectedPaymentMethodIndex,
                  onChanged: (index) => controller.chooseIndex(index),
                ),
              ),
            ],
          ),
    );
  }
}
