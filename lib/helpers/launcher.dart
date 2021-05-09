import 'package:url_launcher/url_launcher.dart';

class Launcher {
  Future<dynamic> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
