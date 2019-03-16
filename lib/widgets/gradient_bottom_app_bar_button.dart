import 'package:flutter/material.dart';

class GradientBottomAppBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String tooltip;
  final Function onPressed;

  GradientBottomAppBarButton(
      {this.icon, this.label, this.tooltip, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: IconButton(
            tooltip: tooltip,
            highlightColor: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(horizontal: 25),
            icon: Icon(
              icon,
              size: 30,
            ),
            onPressed: onPressed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
