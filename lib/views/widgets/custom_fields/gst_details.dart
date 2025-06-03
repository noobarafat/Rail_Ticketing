import 'package:flutter/material.dart';

class GstDetails extends StatelessWidget {
  const GstDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("GSTIN"),
        TextFormField(),
        const SizedBox(height: 8),
        _buildTitle("Name"),
        TextFormField(
          decoration: InputDecoration(
            enabled: false,
            fillColor: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 8),
        _buildSection("Flat/Door/Block", "Street/Lane"),
        const SizedBox(height: 8),
        _buildSection("PIN", "Area/Locality"),
        const SizedBox(height: 8),
        _buildTitle("City"),
        TextFormField(
          decoration: InputDecoration(
            enabled: false,
            fillColor: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String name1, String name2) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(name1),
              TextFormField(
                decoration: InputDecoration(
                  enabled: false,
                  fillColor: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(name2),
              TextFormField(
                decoration: InputDecoration(
                  enabled: false,
                  fillColor: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding _buildTitle(String name) {
    return Padding(
      padding: EdgeInsets.only(left: 12, bottom: 4),
      child: Text(name),
    );
  }
}
