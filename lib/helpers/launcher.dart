import 'package:url_launcher/url_launcher_string.dart';

class Launcher {
  Future<dynamic> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchURL(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
