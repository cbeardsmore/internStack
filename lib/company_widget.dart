import 'package:flutter/material.dart';
import 'models/company.dart';
import 'widgets/gradient_app_bar.dart';
import 'widgets/gradient_bottom_app_bar.dart';

class CompanyWidget extends StatelessWidget {
  final Company company;

  CompanyWidget(this.company);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: GradientAppBar(title: company.name),
      ),
      body: Stack(children: <Widget>[
        ListView(
          children: <Widget>[
            _imageSection(),
            _titleSection(),
            _industrySection(),
          ],
        ),
      ]),
      bottomNavigationBar:
          BottomAppBar(child: GradientBottomAppBar(url: company.applyLink)),
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
