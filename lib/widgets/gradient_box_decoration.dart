import 'package:flutter/material.dart';

class GradientBoxDecoration {
  static BoxDecoration createGradient(BuildContext context) {
    return BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Theme.of(context).primaryColorDark,
        Theme.of(context).primaryColorLight
      ],
      begin: const FractionalOffset(0.1, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 15.0],
      tileMode: TileMode.clamp,
    ));
  }
}
