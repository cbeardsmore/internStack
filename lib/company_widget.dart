import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'widgets/gradient_app_bar.dart';
import 'widgets/gradient_bottom_app_bar.dart';
import 'widgets/curver_corner_card.dart';
import 'widgets/primary_raised_button_container.dart';

import 'models/company.dart';
import 'models/status.dart';
import 'services/firestore.dart';
import 'services/dates.dart';

class CompanyWidget extends StatelessWidget {
  final Company company;

  CompanyWidget(this.company);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: GradientAppBar(title: company.name),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(padding: EdgeInsets.only(bottom: 20),
            child: CurverCornerCard(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    _buildImageStack(context),
                    SizedBox(height: 10),
                    _buildCompanyInfoRow(context, Icons.add_location,
                        company.location, 'LOCATION'),
                    Divider(),
                    _buildCompanyInfoRow(
                        context, Icons.work, company.industry, 'INDUSTRY'),
                    Divider(),
                    _buildCompanyInfoRow(context, Icons.flight_takeoff,
                        company.founded, 'FOUNDED'),
                    Divider(),
                    _buildCompanyInfoRow(context, Icons.calendar_today,
                        formatDate(company.closingDate) ?? 'Unknown', 'CLOSING DATE', 'ADD'),
                    Divider(),
                  ],
                )),
          );
        },
      ),
      bottomNavigationBar:
          BottomAppBar(child: GradientBottomAppBar(company:company)),
    );
  }

  Widget _buildImageStack(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          child: CachedNetworkImage(
              imageUrl: company.image,
              placeholder: Image.asset('assets/company_default.jpg',
                  fit: BoxFit.fitWidth),
              errorWidget: Image.asset('assets/company_default.jpg',
                  fit: BoxFit.fitWidth),
              fit: BoxFit.cover),
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width,
        ),
        _buildChip()
      ],
    );
  }

  Widget _buildChip() {
    Status status = Status(company.closingDate, company.isOpen);

    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 4),
      child: Chip(
        label: Text(status.getName()),
        backgroundColor: status.getColor(),
      ),
    );
  }

  Widget _buildCompanyInfoRow(
      BuildContext context, IconData icon, String title, String subtitle,
      [String buttonText]) {
    return Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Icon(
          icon,
          color: Theme.of(context).accentColor,
          size: 55,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(subtitle), Text(title)],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 80),
        child: buttonText == null || company.closingDate != null
            ? Container(width: 0, height: 0)
            : PrimaryRaisedButtonContainer(
                width: 0.2,
                height: 0.05,
                color: Theme.of(context).primaryColorLight,
                title: 'Add',
                onPressed: () => _selectDate(context)),
      )
    ]);
  }

  void _selectDate(BuildContext context) async {
    DateTime date = await datePicker(context);
    if (date == null)
      return;

    saveClosingDate(company.name, date);

    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).accentColor,
        duration: Duration(seconds: 3),
        content: Text(
          'Closing Date Received. Thanks!',
          textAlign: TextAlign.center,
        )));
  }

}
