import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rail_ticketing/viewmodels/journey_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_checkbox.dart';

class JourneyDetails extends StatelessWidget {
  JourneyDetails({super.key, required this.controller});

  final JourneyDetailsViewmodel controller;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JourneyDetailsViewmodel>(
      builder: (_) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle("From"),
              TextFormField(
                controller: controller.journeyDetails.journeyFrom,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Choose departure";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 4)),
              Align(alignment: Alignment.center, child: Icon(Icons.swap_calls)),
              _buildTitle("To"),
              TextFormField(
                controller: controller.journeyDetails.journeyTo,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Choose destination";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              _buildTitle("Date"),
              _buildDatePicker(context, controller),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              _buildTitle("Class"),
              _buildClassSection(),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              _buildTitle("Quota"),
              _buildQuotaSection(),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              _buildTitle("Train No"),
              _buildSearchTrainSection(context),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              _buildTitle("Boarding Station"),
              TextField(
                controller: controller.journeyDetails.boradingStation,
                decoration: InputDecoration(hintText: "Optional"),
              ),
              Padding(padding: EdgeInsets.only(bottom: 4)),
              CustomCheckBox(),
            ],
          ),
        );
      },
    );
  }

  Row _buildSearchTrainSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: TextField(),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
      ],
    );
  }

  TextFormField _buildDatePicker(
    BuildContext context,
    JourneyDetailsViewmodel controller,
  ) {
    return TextFormField(
      controller: controller.dateController,
      validator: (value) {
        if (value == null || controller.journeyDetails.journyDate == null) {
          return "Pick a date";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () => controller.pickDate(context),
            icon: Icon(Icons.calendar_month),
          ),
        ),
      ),
    );
  }

  GetBuilder<JourneyDetailsViewmodel> _buildClassSection() {
    return GetBuilder<JourneyDetailsViewmodel>(
      builder: (controller) {
        return DropdownButtonFormField<String>(
          value: controller.journeyDetails.journeyClass,
          items:
              controller.availableClass
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: (val) {
            controller.chooseClass(val);
          },
        );
      },
    );
  }

  GetBuilder<JourneyDetailsViewmodel> _buildQuotaSection() {
    return GetBuilder<JourneyDetailsViewmodel>(
      builder: (controller) {
        return DropdownButtonFormField<String>(
          value: controller.journeyDetails.journeyQuota,
          items:
              controller.availableQuota
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: (val) {
            controller.chooseQuota(val);
          },
        );
      },
    );
  }

  Padding _buildTitle(String name) {
    return Padding(
      padding: EdgeInsets.only(left: 12, bottom: 4),
      child: Text(name),
    );
  }
}
