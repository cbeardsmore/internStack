import 'package:flutter/material.dart';
import 'gradient_box_decoration.dart';
import '../services/utils.dart';

class GradientBottomAppBar extends StatelessWidget {
  final String url;

  GradientBottomAppBar({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: GradientBoxDecoration.createGradient(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildIconButton(context, Icons.near_me, 'Apply',
              'Open application url', () => launchURL(url)),
          _buildIconButton(context, Icons.share, 'Share',
              'Share application url', () => shareURL(url)),
          _buildIconButton(context, Icons.calendar_today, 'Notify',
              'Notify before closing date', () => launchURL(url))
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
