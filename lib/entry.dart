import 'package:flutter/material.dart';
import 'widgets/primary_raised_button_container.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _buildBackground(),
        _buildLogo(),
        _buildButton(context),
      ],
    ));
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/entry_background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
        alignment: AlignmentDirectional(0, -0.7),
        child: Image.asset(
          "assets/logo.png",
          scale: 0.8,
        ));
  }

  Widget _buildButton(BuildContext context) {
    return PrimaryRaisedButtonContainer(
      title: 'START',
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/listing');
      },
    );
  }
}
