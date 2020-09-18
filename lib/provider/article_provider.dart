import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/medium/medium_model.dart';

class ArticleProvider with ChangeNotifier {
  Future getMediumArticles() async {
    var url =
        'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@rageremix';
    http.Response response = await http.get(url);
    return getStatus(response);
  }

  getStatus(http.Response response){
    if(response.statusCode == 200){
      return MediumModel.fromJson(json.decode(response.body));
    } else {
      print("Unable to fetch");
    }
  }
}
