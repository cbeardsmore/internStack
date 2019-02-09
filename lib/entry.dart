import 'package:flutter/material.dart';
import 'widgets/primary_raised_button_container.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _buildBackground(),
        _buildLogo(context),
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

  // Widget _buildLogo() {
  //   return Container(
  //       alignment: AlignmentDirectional(0, -0.7),
  //       child: Image.asset(
  //         "assets/logo.png",
  //         scale: 0.8,
  //       ));
  // }

  Widget _buildLogo(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, -0.68),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.84,
          decoration: new BoxDecoration(
              border: new Border.all(
                  color: Theme.of(context).primaryColor, width: 5.0, style: BorderStyle.solid),
              borderRadius: new BorderRadius.only(topLeft: new Radius.circular(50.0))),
          child: Center(
            child: Text(
              'internStack',
              style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
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
