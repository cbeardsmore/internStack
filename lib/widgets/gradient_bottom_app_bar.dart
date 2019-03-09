import 'package:flutter/material.dart';
import 'gradient_box_decoration.dart';

import '../services/utils.dart';
import '../models/company.dart';
import '../models/status.dart';

class GradientBottomAppBar extends StatelessWidget {
  final Company company;

  GradientBottomAppBar({this.company});

  @override
  Widget build(BuildContext context) {
    Status status = Status(company.closingDate, company.isOpen);

    return Container(
      height: 70,
      decoration: GradientBoxDecoration.createGradient(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildIconButton(context, Icons.near_me, 'Apply',
              'Open application url', () => launchURL(company.applyLink)),
          _buildIconButton(context, Icons.share, 'Share',
              'Share application url', () => shareURL(company.applyLink)),
          _buildIconButton(
              context,
              Icons.calendar_today,
              'Notify',
              'Notify before closing date',
              () => arrangeNotification(context, company.name,
                  'Applications are ' + status.getName()))
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, String label,
      String tooltip, Function onPressed) {
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
