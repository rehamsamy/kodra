import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:kodra/app/shared/AnimatedWidgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      // Get.off(() => LocalStorage.isLoggedIn ? const HomeScreen() : const AuthScreen());
      Get.off(()=>HomeView());
    });

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Container(
          height: height,
          alignment: AlignmentDirectional.topCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: AnimatedWidgets(
            duration: 2,
            horizontalOffset: 0,
            verticalOffset: 150,
            child: Container(
              margin: EdgeInsets.only(top: height / 3),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/icon2.png',),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
