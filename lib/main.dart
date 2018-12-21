import 'package:flutter/material.dart';
import 'company_list.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'internStack',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: EntryPage(),
    );
  }
}

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Image.asset('assets/entry_logo.png'),
          RaisedButton(
            child: Text('Enter'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListingPage(title: 'internStack')),
              );          
            },
          ),
        ]
      ),
    );
  }
}

class ListingPage extends StatelessWidget {
  ListingPage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CompanyList(companies),
    );
  }
}