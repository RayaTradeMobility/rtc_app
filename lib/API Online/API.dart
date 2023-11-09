// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rtc_app/models/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  String url = "http://www.rayatrade.com/RayaTadePortalAPI/api/";

  void downloadFile(String fileUrl) async {
    var time = DateTime.now().millisecondsSinceEpoch;
    var path = "/storage/emulated/0/Download/TestSheet-$time.xlsx";
    var file = File(path);
    var res = await http.get(Uri.parse(fileUrl));
    file.writeAsBytes(res.bodyBytes);

    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Downloaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (res.statusCode != 200) {
      Fluttertoast.showToast(
          msg: "Something went wrong, Please try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  login(String username, String password) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://www.rayatrade.com/RayaTadePortalAPI/api/users/getuserinfo/NA/$username/$password'));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('username', username);
      prefs.setString('password', password);
      if (kDebugMode) {
        print('true');
      }
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      if (kDebugMode) {
        print('false');
      }
      throw Exception('Failed to login');
    }
  }
}
