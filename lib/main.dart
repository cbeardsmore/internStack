import 'package:flutter/material.dart';
import 'entry.dart';
import 'listing.dart';
import 'submission.dart';
import 'about.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'internStack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

