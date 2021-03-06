import 'package:flutter/material.dart';

class CurverCornerCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;

  CurverCornerCard({this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0))),
        color: Theme.of(context).cardColor,
        margin: margin ?? EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: child);
  }
}
