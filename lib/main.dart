import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/core/values/localization/translation.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kodra/app/modules/items/controller/ItemController.dart';
import 'package:kodra/app/modules/items/splash_screen.dart';
import 'package:kodra/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await Firebase.initializeApp();
  runApp( const CrazyApp(),);
}
class CrazyApp extends StatefulWidget {
  const CrazyApp({Key? key}) : super(key: key);
  @override
  State<CrazyApp> createState() => _CrazyAppState();
}
class _CrazyAppState extends State<CrazyApp> {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return
      ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) =>
            Directionality(
              textDirection: LocalStorage.isAr ? TextDirection.rtl :
              TextDirection.ltr,
              child: ValueListenableBuilder(
                  valueListenable: _notifier,
                  builder: (context, mode, _) {
                    return GetMaterialApp(
                        navigatorKey: navigatorKey,
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: const [
                          Locale('en', 'US'), // include country code too
                          Locale('ar', 'EG'), // include country code too
                        ],
                        // locale:  Locale('ar', 'EG'),
                        defaultTransition: Transition.cupertino,
                        transitionDuration: const Duration(milliseconds: 500),
                        translations: Translation(),
                        initialBinding: GetBinding(),
                        locale:
                        LocalStorage.isAr ? const Locale('ar') : const Locale(
                            'en'),
                        fallbackLocale: const Locale('en'),
                        title: 'Qodra',
                       theme: darkThemeData(context),
                        // darkTheme:ThemeData(
                        //   brightness: Brightness.dark,
                        //   /* dark theme settings */
                        // ),
                        // ThemeData(
                        //     primarySwatch: Colors.green,
                        //     platform: TargetPlatform.iOS),
                        home: const SplashScreen()
                    );
                  }
              ),
            ),


      );
  }
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
        primaryColor: Color(0xFF5B4B49),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
  }

// dark Theme
  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
        primaryColor: Color(0xFFFF1D00),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
  }

  ThemeData getLightTheme() {
    return ThemeData(
      // fontFamily: FontFamily.regular,
       scaffoldBackgroundColor: kBackgroundDarkColor,
      platform: TargetPlatform.iOS,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 20.sp,
              // fontFamily: FontFamily.regular,
              color: Colors.white),
          errorStyle: TextStyle(
              fontSize: 18.sp,
              // fontFamily: FontFamily.regular,
              color: Colors.red)),
      primaryTextTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              // fontFamily: FontFamily.regular,
              // color: colorPrimary
          )),
      primarySwatch: Colors.green,
      elevatedButtonTheme: const ElevatedButtonThemeData(),
      appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundDarkColor,
          centerTitle: true,
          elevation: 0),
      toggleableActiveColor: kPrimaryColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,);
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      // fontFamily: FontFamily.regular,
      scaffoldBackgroundColor: kBackgroundDarkColor,
      platform: TargetPlatform.iOS,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 20.sp,
              // fontFamily: FontFamily.regular,
              color: Colors.black),
          errorStyle: TextStyle(
              fontSize: 18.sp,
              // fontFamily: FontFamily.regular,
              color: Colors.black)),
      primaryTextTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            // fontFamily: FontFamily.regular,
            // color: colorPrimary
          )),
      primarySwatch: Colors.orange,
      elevatedButtonTheme: const ElevatedButtonThemeData(),
      appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundDarkColor,
          centerTitle: true,
          elevation: 0),
      toggleableActiveColor: kPrimaryColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,);
  }
}