import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'models/company.dart';
import 'widgets/gradient_app_bar.dart';
import 'widgets/gradient_bottom_app_bar.dart';
import 'widgets/curver_corner_card.dart';

class CompanyWidget extends StatelessWidget {
  final Company company;

  CompanyWidget(this.company);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: GradientAppBar(title: company.name),
      ),
      body: CurverCornerCard(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(
                child: CachedNetworkImage(
                    imageUrl: company.image,
                    placeholder: Image.asset('assets/company_default.jpg'),
                    errorWidget: Image.asset('assets/company_default.jpg'),
                    fit: BoxFit.cover),
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 20),
              _buildCompanyInfoRow(
                  context, Icons.add_location, company.location, 'LOCATION'),
              Divider(),
              _buildCompanyInfoRow(
                  context, Icons.work, company.industry, 'INDUSTRY'),
              Divider(),
              _buildCompanyInfoRow(
                  context, Icons.flight_takeoff, company.founded, 'FOUNDED'),
              Divider(),
              _buildCompanyInfoRow(context, Icons.calendar_today, 'Unknown',
                  'CLOSING DATE', 'ADD'),
              Divider(),
            ],
          )),
      bottomNavigationBar:
          BottomAppBar(child: GradientBottomAppBar(url: company.applyLink)),
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
          size: 60,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(subtitle), Text(title)],
      )
    ]);
  }
}
