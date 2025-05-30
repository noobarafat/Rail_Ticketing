import 'package:flutter/material.dart';
import 'package:rail_ticketing/views/widgets/custom_checkbox.dart';

class JourneyDetails extends StatelessWidget {
  const JourneyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("From"),
        TextFormField(),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Align(alignment: Alignment.center, child: Icon(Icons.swap_calls)),
        _buildTitle("To"),
        TextField(),
        _buildTitle("Date"),
        TextField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.calendar_month),
              ),
            ),
          ),
        ),
        _buildTitle("Class"),
        TextField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
        _buildTitle("Quota"),
        TextField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
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
        _buildTitle("Boarding Station"),
        TextField(decoration: InputDecoration(hintText: "Optional")),
        CustomCheckBox(),
      ],
    );
  }

  Padding _buildTitle(String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8),
      child: Text(name),
    );
  }
}
