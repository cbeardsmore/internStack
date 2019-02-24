import 'package:flutter/material.dart';

class PrimaryRaisedButtonContainer extends StatelessWidget {
  final String title;
  final Function onPressed;
  final AlignmentGeometry alignment;
  final double width;
  final double height;
  final Color color;

  PrimaryRaisedButtonContainer(
      {this.title,
      this.onPressed,
      this.alignment,
      this.width,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    double buttonHeight =
        MediaQuery.of(context).size.height * (height ?? 0.065);
    double buttonWidth = MediaQuery.of(context).size.width * (width ?? 0.4);

    return Container(
      alignment: alignment ?? AlignmentDirectional(0, 0.7),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: RaisedButton(
          child: Text(title, style: Theme.of(context).textTheme.button),
          color: color ?? Theme.of(context).primaryColor,
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
