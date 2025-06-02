import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rail_ticketing/viewmodels/child_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/journey_details_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/login_viewmodel.dart';
import 'package:rail_ticketing/viewmodels/passenger_details_viewmodel.dart';
import 'package:rail_ticketing/views/pages/website_form_page.dart';

class FormInputPage extends StatefulWidget {
  const FormInputPage({
    super.key,
    required this.formName,
    required this.loginViewModel,
    required this.journeyDetailsViewmodel,
    required this.passengerDetailsViewmodel,
    required this.childDetailsViewmodel,
  });

  final String formName;
  final LoginViewmodel loginViewModel;
  final JourneyDetailsViewmodel journeyDetailsViewmodel;
  final PassengerDetailsViewmodel passengerDetailsViewmodel;
  final ChildDetailsViewmodel childDetailsViewmodel;

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
        children: [
          WebsiteFormPage(
            childDetailsViewmodel: widget.childDetailsViewmodel,
            journeyDetailsViewmodel: widget.journeyDetailsViewmodel,
            loginViewModel: widget.loginViewModel,
            passengerDetailsViewmodel: widget.passengerDetailsViewmodel,
          ),
          WebsiteFormPage(
            childDetailsViewmodel: widget.childDetailsViewmodel,
            journeyDetailsViewmodel: widget.journeyDetailsViewmodel,
            loginViewModel: widget.loginViewModel,
            passengerDetailsViewmodel: widget.passengerDetailsViewmodel,
          ),
        ],
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
        GetBuilder<LoginViewmodel>(
          builder: (_) {
            return IconButton(
              onPressed: widget.loginViewModel.toggleObsecure,
              icon: Icon(
                widget.loginViewModel.isObsecure
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 32,
                color: Colors.white,
              ),
            );
          },
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
