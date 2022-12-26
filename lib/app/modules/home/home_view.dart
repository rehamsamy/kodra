import 'package:flutter/material.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text_field.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                gradient: LinearGradient(
                  colors: [
                   kBackgroundDarkColor,
                    kBackgroundColor
                  ]
                ),
                borderRadius: BorderRadius.circular(20),

              ),
              child: Image.asset('assets/images/icon2.png'),
            ),
          ),
          Flexible(child: Container(
            width: Get.width,
            color: kBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               AppProgressButton(onPressed: (val){},text: 'fffffffffff',),
                AppProgressButton(onPressed: (val){},text: 'dddddddd',)
              ],
            ),
          )),
          Flexible(
            flex: 1,
            child:Container(
                color: kBackgroundDarkColor,),
          ),
        ],
      ),
    );
  }
}
