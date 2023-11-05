import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rtc_app/models/news_model.dart';

import '../models/categories_news_model.dart';

class NewsRepository {
  Future<List<NewsModel>> getCards(String username) async {
    String url =
        'http://www.rayatrade.com/RayaTadePortalAPI/api/Cards/GetCards/436/$username';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json is List) {
        List<NewsModel> models = [];

        for (var item in json) {
          final model = NewsModel.fromJson(item);
          models.add(model);
        }

        if (models.isNotEmpty) {
          return models;
        }
      }
    }

    throw Exception('Error');
  }

  Future<List<NewsModel>> getEventCards(String username) async {
    String url =
        'http://www.rayatrade.com/RayaTadePortalAPI/api/Cards/GetCards/442/$username';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json is List) {
        List<NewsModel> models = [];

        for (var item in json) {
          final model = NewsModel.fromJson(item);
          models.add(model);
        }

        if (models.isNotEmpty) {
          return models;
        }
      }
    }

    throw Exception('Error');
  }

  Future<List<NewsModel>> getJobsCards(String username) async {
    String url =
        'http://www.rayatrade.com/RayaTadePortalAPI/api/Cards/GetCards/440/$username';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json is List) {
        List<NewsModel> models = [];

        for (var item in json) {
          final model = NewsModel.fromJson(item);
          models.add(model);
        }

        if (models.isNotEmpty) {
          return models;
        }
      }
    }

    throw Exception('Error');
  }

  Future<List<NewsModel>> getKYCCards(String username) async {
    String url =
        'http://www.rayatrade.com/RayaTadePortalAPI/api/Cards/GetCards/439/$username';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json is List) {
        List<NewsModel> models = [];

        for (var item in json) {
          final model = NewsModel.fromJson(item);
          models.add(model);
        }

        if (models.isNotEmpty) {
          return models;
        }
      }
    }

    throw Exception('Error');
  }

  Future<List<NewsModel>> getPoliciesCards(String username) async {
    String url =
        'http://www.rayatrade.com/RayaTadePortalAPI/api/Cards/GetCards/6/$username';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json is List) {
        List<NewsModel> models = [];

        for (var item in json) {
          final model = NewsModel.fromJson(item);
          models.add(model);
        }

        if (models.isNotEmpty) {
          return models;
        }
      }
    }

    throw Exception('Error');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=227b721271b54f59b37211c4db65df6c';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
