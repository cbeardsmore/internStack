import 'package:flutter/material.dart';
import 'gradient_app_bar.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(flexibleSpace: GradientAppBar("About Us")));
  }
}
