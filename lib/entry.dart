import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        _buildBackground(),
        _buildLogo(),
        _buildButton(context),
      ],
    ));
  }

  Container _buildBackground() {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/entry_background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildLogo() {
    return Container(
        alignment: AlignmentDirectional(0, -0.7),
        child: Image.asset(
          "assets/logo.png",
          scale: 0.8,
        ));
  }

  Container _buildButton(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.065;
    double buttonWidth = MediaQuery.of(context).size.width * 0.4;

    return Container(
      alignment: AlignmentDirectional(0, 0.7),
      child: new SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: new RaisedButton(
          child: const Text('START',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontFamily: 'Roboto')),
          color: Color(0xFF6200EE),
          splashColor: Color(0xFF25DDC5),
          elevation: 10.0,
          highlightElevation: 20.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/listing');
          },
        ),
      ),
    );
  }
}
