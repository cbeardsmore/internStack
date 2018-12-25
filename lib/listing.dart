import 'package:flutter/material.dart';
import 'company_list.dart';
import 'about.dart';

class ListingPage extends StatelessWidget {
  ListingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.person_outline, color: Colors.white),
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AboutPage()),
                );
              },
              ),
            ),
        ]),
      body: CompanyList(),
    );
  }
}
