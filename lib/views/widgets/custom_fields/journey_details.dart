import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:rail_ticketing/viewmodels/journey_details_viewmodel.dart';
import 'package:rail_ticketing/views/widgets/custom_checkbox.dart';

class JourneyDetails extends StatelessWidget {
  JourneyDetails({super.key});

  final JourneyDetailsViewmodel _journeyDetailsViewmodel = Get.put(
    JourneyDetailsViewmodel(),
  );

  final TextEditingController dateController = TextEditingController();

  Future<void> pickDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (newDate != null && newDate != _journeyDetailsViewmodel.selectedDate) {
      _journeyDetailsViewmodel.updateDate(newDate);
      dateController.text = DateFormat('dd-MM-yyyy').format(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("From"),
        TextFormField(),
        Padding(padding: EdgeInsets.only(bottom: 4)),
        Align(alignment: Alignment.center, child: Icon(Icons.swap_calls)),
        _buildTitle("To"),
        TextField(),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        _buildTitle("Date"),
        TextFormField(
          controller: dateController,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () => pickDate(context),
                icon: Icon(Icons.calendar_month),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        _buildTitle("Class"),
        _buildClassSection(),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        _buildTitle("Quota"),
        _buildQuotaSection(),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        _buildTitle("Train No"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: TextField(),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        _buildTitle("Boarding Station"),
        TextField(decoration: InputDecoration(hintText: "Optional")),
        Padding(padding: EdgeInsets.only(bottom: 4)),
        CustomCheckBox(),
      ],
    );
  }

  GetBuilder<JourneyDetailsViewmodel> _buildClassSection() {
    return GetBuilder<JourneyDetailsViewmodel>(
      builder: (controller) {
        return TextField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 12),
              child: DropdownButtonFormField<String>(
                value: controller.selectedClass,
                items:
                    controller.availableClass
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) {
                  controller.chooseClass(val);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GetBuilder<JourneyDetailsViewmodel> _buildQuotaSection() {
    return GetBuilder<JourneyDetailsViewmodel>(
      builder: (controller) {
        return TextField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 12),
              child: DropdownButtonFormField<String>(
                value: controller.selectedQuota,
                items:
                    controller.availableQuota
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) {
                  controller.chooseQuota(val);
                },
              ),
            ),
          ),
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
