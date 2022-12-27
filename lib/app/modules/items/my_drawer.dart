import 'package:flutter/material.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app_constant.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: kBackgroundDarkColor.withOpacity(0.7),
      child:  Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 200,
            height: 60,
            color: kBackgroundColor,
            child: const Center(
              child: AppText(
                ' تواصل معنا !!',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          )),
    );
  }
}
