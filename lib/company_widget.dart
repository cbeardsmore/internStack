import 'package:flutter/material.dart';
import 'company.dart';
import 'gradient_app_bar.dart';

class CompanyWidget extends StatelessWidget {
  final Company company;

  CompanyWidget(this.company);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        flexibleSpace: new GradientAppBar(company.name),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(
            company.image,
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          TitleSection(company),
          TextSection(company),
        ],
      ),
      bottomNavigationBar: ButtonSection(Theme.of(context).primaryColor),
    );
  }
}

/* ****************** Title ****************** */

class TitleSection extends StatelessWidget {
  final Company company;

  TitleSection(this.company);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: titleText(),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('Favourite'),
        ],
      ),
    );
  }

  Container titleText() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "${company.name} Office",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            company.location,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

/* ****************** Bottom Appbar ****************** */

class ButtonSection extends StatelessWidget {
  final Color color;

  ButtonSection(this.color);

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.call), title: Text("CALL")),
        BottomNavigationBarItem(icon: Icon(Icons.near_me), title: Text("APPLY")),
        BottomNavigationBarItem(icon: Icon(Icons.share), title: Text("SHARE")),
      ],
    );
  }

  Column buildButtonCol(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ))
      ],
    );
  }
}

/* ****************** Text ****************** */
class TextSection extends StatelessWidget {
  final Company company;

  TextSection(this.company);

  @override
  Container build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        company.industry,
        softWrap: true,
      ),
    );
  }
}
