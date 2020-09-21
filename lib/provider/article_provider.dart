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

  getStatus(http.Response response) {
    if (response.statusCode == 200) {
      notifyListeners();
      return MediumModel.fromJson(json.decode(response.body));
    } else {
      print("Unable to fetch");
    }
  }

  // Future getDevArticles() async {
  //   var x =
  //       'curl -H "api-key: ${Secrets.GET_DEV_ARTICLES}" https://dev.to/api/articles/me/published';
  //   // curl -H "api-key: zV2qAk96vxkEMukhFmd5yaiC" https://dev.to/api/articles/me/published
  //   var uri = Uri.https('www.dev.to', '/api/articles/me/published');
  //   http.Response response = await http.get(uri, headers: {
  //     'api-key': 'zV2qAk96vxkEMukhFmd5yaiC',
  //     'content-type': 'application/json',
  //   });
  //   // print(HttpRequest.request('https://dev.to/api/articles/me/published',
  //   //     requestHeaders: {
  //   //       'api-key': 'zV2qAk96vxkEMukhFmd5yaiC',
  //   //       'content-type': 'application/json',
  //   //     }));
  //   // print(response);
  // }
}
