import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/medium/medium.dart';

class ArticleProvider with ChangeNotifier {
  Future<dynamic> getMediumArticles() async {
    const String url =
        'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@himanshusharma89';
    final http.Response response = await http.get(url);
    return getStatus(response);
  }

  dynamic getStatus(http.Response response) {
    if (response.statusCode == 200) {
      final MediumModel x = MediumModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
      notifyListeners();
      return x;
    } else {
      // print("Unable to fetch");
    }
  }
}
