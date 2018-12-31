import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
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
      body: new Stack(children: <Widget>[
        ListView(
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
        ButtonSection(company.applyLink)
      ]),
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
  final String url;

  ButtonSection(this.url);

  @override
  Container build(BuildContext context) {
    return new Container(
      alignment: AlignmentDirectional(0, 0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButtonCol(Icons.near_me, "APPLY", _launchURL),
          buildButtonCol(Icons.share, "SHARE", _share),
        ],
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _share() async {
    Share.share('...' + url);
  }

  Padding buildButtonCol(IconData icon, String label, VoidCallback callback) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: new SizedBox(
        height: 60,
        width: 120,
        child: new RaisedButton(
          highlightColor: Colors.blue,
          onPressed: () => callback(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: new Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
