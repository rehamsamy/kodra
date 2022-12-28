import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/core/values/localization/translation.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:kodra/app/modules/items/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kodra/app/modules/user/view/user_view.dart';

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
  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) =>
          Directionality(
            textDirection: LocalStorage.isAr ? TextDirection.rtl :
            TextDirection.ltr,
            child: GetMaterialApp(
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
                LocalStorage.isAr ? const Locale('ar') : const Locale('en'),
                fallbackLocale: const Locale('en'),
                title: 'Crazy Food',
                theme: ThemeData(
                    primarySwatch: Colors.green, platform: TargetPlatform.iOS),
                home:  SplashScreen()
            ),
          ),

    );
  }




}
