import 'dart:convert';

import 'package:kodra/app/data/models/login_model.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:kodra/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PasswordApis{
  Future<LoginModel> changePassword({required String oldPass,required String newPass,required String confirmPass}) async {
    LoginModel loginModel=LoginModel();
    String   baseUrl='https://identitytoolkit.googleapis.com/v1/accounts:update?key=$kApiKey';
    String idToken="AOkPPWRgooP6-v66kyfEqF2tWBy7aDXkezqesobaniIac7Tt_Bm1vGUMwdBLY1qbYvfkCn85GSRf7rpEmNm5JE_h-JBwOBSa8OslkXY4KQMHJNVRxXIxEJKqXa8cPPW-yHG9WHoLBGBoAzB8vDrJUu-ZMpPBU-angKmVz2Nv73Ts17mDykQGiekbdPvaYpJ5PrX5H7-WOzgO";
    Map<String, dynamic> map_new = {
      'password': confirmPass,
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