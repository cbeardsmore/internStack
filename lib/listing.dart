import 'package:flutter/material.dart';
import 'company_list.dart';
import 'widgets/gradient_app_bar.dart';

class ListingPage extends StatelessWidget {
  ListingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CompanyList(),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        flexibleSpace: GradientAppBar(title: title),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/about_us');
              },
            ),
          ),
        ]);
  }

  Container _buildFloatingButton(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/submission',
          );
        },
        tooltip: 'Submit Role',
        child: Icon(Icons.add, size: 40),
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Colors.black,
      ),
    );
  }
}
