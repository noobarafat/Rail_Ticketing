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
      appBar: _buildAppBar(context),

      body: TabBarView(
        controller: _tabController,
        children: [WebsiteFormPage(), RailConnectFormPage()],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        widget.formName,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove_red_eye, size: 32, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.save, size: 32, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.key, size: 32, color: Colors.white),
        ),
      ],
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [Tab(child: Text("WEBSITE")), Tab(child: Text("RAIL CONNECT"))],
    );
  }
}
