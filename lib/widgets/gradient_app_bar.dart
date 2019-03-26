import 'package:flutter/material.dart';
import 'package:internStack/widgets/gradient_box_decoration.dart';

class GradientAppBar extends StatelessWidget {
  final String title;

  GradientAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: GradientBoxDecoration.createGradient(context),
      child: Center(
        child: Text(title, style: Theme.of(context).textTheme.title),
      ),
    );
  }
}
