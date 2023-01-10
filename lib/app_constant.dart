import 'package:kodra/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String userAvatar =
    'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg';
NetworkService networkService = NetworkService(
  baseUrl: baseUrl,
  httpHeaders: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    //'Authorization': 'Bearer ${SharedPrefService.getToken() ?? ''}',
    'Language': Get.locale?.languageCode ?? 'en',
  },
);

const String kApiKey='AIzaSyAOexIWk0Z2ijFeDyS54THCQfbJAYV1zME';
 const String baseUrl = 'https://crazy-65aca-default-rtdb.firebaseio.com';
// const String baseUrl='https://crazyfood-5f22c-default-rtdb.firebaseio.com';
 Color kPrimaryColor = const Color(0xffC0CCFF);
 Color kBackColor1 = const Color(0xffE9F8EE);
 Color kAccentColor = const Color(0xffDA00FF);
const Color kBackgroundColor = Color(0xffD1DDFF);
const Color kBackgroundDarkColor = Color(0xffBFCCFF);
const Color kUnSelectedColor = Color(0xff757DB5);
const Color kAuthGreyColor = Color(0xffF6F6F6);
 Color kPurpleColor = const Color(0xffB86AD6);
const Color kBlueLightColor = Color(0xffE9F8EE);
const Color kGreyColor=Color(0xffDADADA);

const BoxDecoration kContainerDecoraction = BoxDecoration(
    image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/back.png',
        )));

const List<Color> colorsMenu = [
  Color(0xffBEE7CF),
  Color(0xffF4E3B2),
  Color(0xffD5BDE7),
  Color(0xffE7B2AA),
  Color(0xffB9D4E7),
  Color(0xffE6D2E7),
];

//  AppBar kAppBar(String title,Function onPress){
//   return AppBar(
//   title: AppText( title??'',color: Colors.white,),
// centerTitle: true,
// elevation: 0,
// leading: IconButton(
// onPressed:()=>onPress,
// icon: Icon(Icons.arrow_back_ios_sharp),
// ),
// );


