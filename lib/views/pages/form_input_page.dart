import 'package:flutter/material.dart';
import 'package:rail_ticketing/views/pages/rail_connect_form_page.dart';
import 'package:rail_ticketing/views/pages/website_form_page.dart';

class FormInputPage extends StatefulWidget {
  const FormInputPage({super.key, required this.formName});

  final String formName;

  @override
  State<FormInputPage> createState() => _FormInputPageState();
}

class _FormInputPageState extends State<FormInputPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.formName),
        automaticallyImplyLeading: false,

        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(child: Text("Website")), Tab(child: Text("Rail Connect"))],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [WebsiteFormPage(), RailConnectFormPage()],
      ),
    );
  }
}
