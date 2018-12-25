import 'package:flutter/material.dart';
import 'company.dart';

class CompanyWidget extends StatelessWidget {
  final Company company;

  CompanyWidget(this.company);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: AppBar(
            title: Text(company.name),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                company.image,
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              TitleSection(company),
              ButtonSection(Theme.of(context).primaryColor),
              Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    company.description,
                    softWrap: true,
                  ))
            ],
          ),
        );
  }
}

/* ****************** Title ****************** */

class TitleSection extends StatelessWidget {
  final Company company;

  TitleSection(this.company);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: titleText(),
        ),
        Icon(Icons.star, color: Colors.red),
        Text('Favourite'),
      ],
    );
  }

  Column titleText() {
    return Column(
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
    );
  }
}

/* ****************** Button ****************** */

class ButtonSection extends StatelessWidget {
  final Color color;

  ButtonSection(this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildButtonCol(Icons.call, 'CALL'),
        buildButtonCol(Icons.near_me, 'APPLY'),
        buildButtonCol(Icons.share, 'SHARE'),
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
