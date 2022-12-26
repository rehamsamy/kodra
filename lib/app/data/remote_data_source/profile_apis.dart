import 'dart:convert';

import 'package:kodra/app/data/models/login_model.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:kodra/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileApis{
  Future<LoginModel> updateProfileData({required String name,required String email}) async {
    LoginModel loginModel=LoginModel();
    String   baseUrl='https://identitytoolkit.googleapis.com/v1/accounts:update?key=$kApiKey';
    String idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6Ijk1MWMwOGM1MTZhZTM1MmI4OWU0ZDJlMGUxNDA5NmY3MzQ5NDJhODciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoicmVoYSBzYW15IGhqaiIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9jcmF6eS02NWFjYSIsImF1ZCI6ImNyYXp5LTY1YWNhIiwiYXV0aF90aW1lIjoxNjcwMzIzMjAxLCJ1c2VyX2lkIjoiNWsycm9POFpCTWhEZ25BN2lZOXNTbkEwRFNEMiIsInN1YiI6IjVrMnJvTzhaQk1oRGduQTdpWTlzU25BMERTRDIiLCJpYXQiOjE2NzAzMjMyMDEsImV4cCI6MTY3MDMyNjgwMSwiZW1haWwiOiJyQHIuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJAci5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.Pd3_eo4g-TtFW7chrdxjQlKRMRbN6JlKLaYxGhMo6VgFme9PnSc56mbmHgJBSDUiMQD8GOoYsl3-uCzmrAWMqxFncMfNruAGej5o5_XrW1EKMD-K4qqDK8h6dj55-ExmMSmXNZ3ADtZihzIEWyrvADwNqUHh-AQgja8WMHQaHOPUGgYtZwGzZv1WorPaDL_TMOv4n9a2SNaXbOvhdj5I32AoFAGcqrej2WGwCHxhXVdBhNX5JvjYKjvFjs2v1ADUyWsp0wrNKYhBcP8wR1oFpT_24laGBainzdmNMi-TMY_oxXaqM8wktqSrtuYZWIaZiAriqmhPHYleoHwR1yZ5SA";
    Map<String, dynamic> map_new = {
      'displayName': name,
      'email':email,
      // 'idToken':LocalStorage.getUser?.idToken,
      'idToken':idToken,
      'returnSecureToken': true
    };
    Get.log('cccccccc  '+(LocalStorage.getUser?.idToken).toString());
    try {
      var response =
      await http.post(Uri.parse(baseUrl), body: json.encode(map_new));
      if (response.statusCode == 200) {
        print('step1');
        var y = json.decode(response.body);
        loginModel=LoginModel.fromJson(y);
        await LocalStorage.saveUser(loginModel);
        Get.log('save data to storage'+loginModel.toString());

      }else if(response.statusCode==400){
        print('step2');
        var y = json.decode(response.body);
        loginModel=LoginModel.fromJson(y);
        // loginModel=y;
        Get.log('ff '+response.body.toString());
      }
      return loginModel;
    } catch (err) {}
    return loginModel;
  }

}