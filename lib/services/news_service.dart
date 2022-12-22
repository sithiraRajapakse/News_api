import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sithira_newsapp/common/constants.dart';
import 'package:sithira_newsapp/models/article.dart';

Future<List<Article>> getHeadlines() async {
  var headers = {
    "Authorization": apiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeHeadlines,
    {'language': 'en'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    for (var articleJson in (decoded['articles'] as List)) {
      articles.add(Article.fromJson(articleJson));
    }
  }

  return articles;
}

Future<List<Article>> search(String searchText) async {
  var headers = {
    "Authorization": apiKey,
  };
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);

  var url = Uri.https(
    newsApiUrl,
    newsRouteEverything,
    {
      'language': 'en',
      'q': searchText,
      'sortBy': 'popularity',
      'from': formattedDate
    },
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    for (var articleJson in (decoded['articles'] as List)) {
      articles.add(Article.fromJson(articleJson));
    }
  }

  return articles;
}

Future<List<Article>> byCategory(String category) async {
  var headers = {
    "Authorization": apiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    routeHeadlines,
    {'language': 'en', 'category': category, 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    for (var articleJson in (decoded['articles'] as List)) {
      articles.add(Article.fromJson(articleJson));
    }
  } else {
    print(response.statusCode);
    print(response.body);
  }

  return articles;
}

Future<List<Article>> byCountry(String countryCode) async {
  var headers = {
    "Authorization": apiKey,
  };
  var url = Uri.https(
    newsApiUrl,
    newsRouteEverything,
    {'language': 'en', 'country': countryCode, 'sortBy': 'popularity'},
  );

  var response = await http.get(url, headers: headers);

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);

    for (var articleJson in (decoded['articles'] as List)) {
      articles.add(Article.fromJson(articleJson));
    }
  }

  return articles;
}

Future<List<Article>> latest() async {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  var response = await sendGet(routeHeadlines, {
    'language': 'en',
    'sortBy': 'popularity',
    'from': formattedDate,
    'country': 'us'
  });

  List<Article> articles = [];
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    for (var articleJson in (jsonData['articles'] as List)) {
      articles.add(Article.fromJson(articleJson));
    }
  } else {
    print(response.statusCode);
    print(response.body);
  }

  return articles;
}

Future<http.Response> sendGet(routeString, parameters) async {
  var headers = {
    "Authorization": apiKey,
    'Access-Control-Allow-Origin': '*',
  };
  var url = Uri.https(
    newsApiUrl,
    routeString,
    parameters,
  );

  var response = await http.get(url, headers: headers);
  return response;
}
