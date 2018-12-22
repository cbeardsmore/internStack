import 'package:flutter/material.dart';
import 'entry.dart';

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
