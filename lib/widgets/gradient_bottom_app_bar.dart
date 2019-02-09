import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'gradient_box_decoration.dart';

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
          _buildIconButton(context, Icons.near_me, 'Apply', 'Open an application Url', _launchURL),
          _buildIconButton(context, Icons.share, 'Share', 'Share the application Url', _share),
          _buildIconButton(context, Icons.calendar_today, 'Notify', 'Notification before the closing date', _launchURL)
        ],
      ),
    );
  }

  Widget _buildIconButton(
      BuildContext context, IconData icon, String label, String tooltip, Function onPressed) {
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

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _share() async {
    Share.share('...' + url);
  }
}
