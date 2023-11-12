import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rtc_app/models/news_model.dart';
import '../models/categories_news_model.dart';
import '../models/response_message_model.dart';

// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class NewsRepository {
  String urls = "http://www.rayatrade.com/RayaTadePortalAPI/api";

  Future<List<NewsModel>> getCards(String username) async {
    String url = '$urls/Cards/GetCards/436/$username';

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
    String url = '$urls/Cards/GetCards/442/$username';

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

  Future<List<NewsModel>> getEmployeeOfferCards(String username) async {
    String url = '$urls/Cards/GetCards/443/7';

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
    String url = '$urls/Cards/GetCards/440/$username';

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
    String url = '$urls/Cards/GetCards/439/$username';

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
    String url = '$urls/Cards/GetCards/6/$username';

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

  Future<List<NewsModel>> getComplaintsCards(String username) async {
    String url = '$urls/Cards/GetCards/4/7';

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

  Future<List<NewsModel>> getSuggestionCards(String username) async {
    String url = '$urls/Cards/GetCards/438/7';

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

  Future<ResponseMessage> updatePassword(
      String username, String password) async {
    String url =
        "http://www.rayatrade.com/RayaTadePortalAPI/api/users/UpdatePassword/$username/$password";
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return ResponseMessage.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<ResponseMessage> uploadFile(
      File fileToUpload, String description, String user) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$urls/DocumentUpload/MediaUpload'),
    );

    // var fileExtension = ".${fileToUpload.path.split('.').last}";

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      fileToUpload.path,
      contentType: MediaType('application', 'octet-stream'),
    ));

    var response = await request.send();
    if (response.statusCode == 200) {
      return ResponseMessage();
    } else {
      throw Exception('File upload failed');
    }
  }

  Future<ResponseMessage> saveFile(
      String cvPath, String description, String userEmail) async {
    var url = '$urls/Jobs_CVs/AddCVs';

    var body = {
      "Description": description,
      "CV_Path": cvPath,
      "submitter": userEmail,
    };

    var response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return ResponseMessage();
    } else {
      throw Exception('File saving failed');
    }
  }

  Future<ResponseMessage> sendUserToken(String token, String deviceId) async {
    var url = "${"$urls/Users/UpdateToken_byDeviceID/$token"}/$deviceId";

    if (kDebugMode) {
      print("UpdateToken_byDeviceID : $url");
    }

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ResponseMessage();
    } else {
      throw Exception('Sending user token failed');
    }
  }

  Future<ResponseMessage> submit(String title, String message, int pageID,
      String username, String hrID) async {
    var url = "${urls}Cards/AddCards/";

    var body = {
      "HeaderAR": title,
      "HeaderEN": title,
      "DetailsEN": message,
      "DetailsAR": message,
      "MenuID": pageID,
      "Complain_Idea_StatusID": 1,
      "CreatedBy": username,
      "UserID": hrID,
    };

    var response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      return ResponseMessage();
    } else {
      throw Exception('Submit failed');
    }
  }
}
