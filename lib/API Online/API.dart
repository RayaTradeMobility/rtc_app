// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rtc_app/models/LoginModel.dart';
// import 'package:rtc_app/models/responseMessageModel.dart';
class API{
  String url ="http://www.rayatrade.com/RayaTadePortalAPI/api/";

login(String username, String password) async {
  var request = http.Request('GET', Uri.parse('http://www.rayatrade.com/RayaTadePortalAPI/api/users/getuserinfo/NA/$username/$password'));


  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  print(response.body);

    if (response.statusCode == 200) {
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
