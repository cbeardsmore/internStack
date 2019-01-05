import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'models/company.dart';
import 'widgets/gradient_app_bar.dart';

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
            _imageSection(),
            _titleSection(),
            _industrySection(),
          ],
        ),
        ButtonSection(company.applyLink)
      ]),
    );
  }

  ClipRRect _imageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Card(
        margin: EdgeInsets.all(10),
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: company.image,
            fit: BoxFit.fitWidth),
      ),
    );
  }

  Container _titleSection() {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _textSection(),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('Favourite'),
        ],
      ),
    );
  }

  Container _textSection() {
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

  Container _industrySection() {
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        company.industry,
        softWrap: true,
      ),
    );
  }
}

/* *********************** Bottom Appbar ********************** */

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
