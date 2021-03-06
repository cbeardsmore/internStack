import 'package:flutter/material.dart';
import 'package:internStack/entry.dart';
import 'package:internStack/listing.dart';
import 'package:internStack/submission.dart';
import 'package:internStack/about.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'internStack',
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
        primaryColorDark: Color(0xFF302DAD),
        primaryColorLight: Color(0xFFC46BD6),
        accentColor: Color(0xFF25DDC5),
        cardColor: Colors.grey[100],
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
            title: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            display1: TextStyle(fontSize: 25.0, color: Colors.black),
            display2: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            display3: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            button: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 2,
            )),
      ),
      home: EntryPage(),
      routes: {
        "/listing": (_) => ListingPage(title: 'internStack'),
        "/submission": (_) => SubmissionPage(),
        "/about_us": (_) => AboutPage()
      },
    );
  }
}
