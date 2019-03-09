import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

shareURL(String url) async {
  Share.share('Found by internStack: ' + url);
}
