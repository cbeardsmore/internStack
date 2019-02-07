import 'package:flutter/material.dart';

class PrimaryRaisedButtonContainer extends StatelessWidget {
  final String title;
  final Function onPressed;

  PrimaryRaisedButtonContainer({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.065;
    double buttonWidth = MediaQuery.of(context).size.width * 0.4;

    return Container(
      alignment: AlignmentDirectional(0, 0.7),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: RaisedButton(
          child: Text(title, style: Theme.of(context).textTheme.button),
          color: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).accentColor,
          elevation: 10.0,
          highlightElevation: 20.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
