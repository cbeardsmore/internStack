import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      decoration: gradient(),
      child: new Center(
        child: new Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  BoxDecoration gradient() {
    return new BoxDecoration(
        gradient: LinearGradient(
      colors: [
        const Color(0xFF3366FF),
        const Color(0xFF00CCFF),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 15.0],
      tileMode: TileMode.clamp,
    ));
  }
}