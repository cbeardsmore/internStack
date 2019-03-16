import 'package:flutter/material.dart';
import 'gradient_box_decoration.dart';
import 'gradient_bottom_app_bar_button.dart';

class GradientBottomAppBar extends StatelessWidget {
  final Function leftButtonPressed;
  final Function centerButtonPressed;
  final Function rightButtonPressed;

  GradientBottomAppBar(
      {this.leftButtonPressed,
      this.centerButtonPressed,
      this.rightButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: GradientBoxDecoration.createGradient(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GradientBottomAppBarButton(
              icon: Icons.near_me,
              label: 'Apply',
              tooltip: 'Open application url',
              onPressed: leftButtonPressed),
          GradientBottomAppBarButton(
              icon: Icons.share,
              label: 'Share',
              tooltip: 'Share application url',
              onPressed: centerButtonPressed),
          GradientBottomAppBarButton(
              icon: Icons.calendar_today,
              label: 'Notify',
              tooltip: 'Notify before closing date',
              onPressed: rightButtonPressed),
        ],
      ),
    );
  }
}
