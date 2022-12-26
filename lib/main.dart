import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/core/values/localization/translation.dart';
import 'package:kodra/app/data/models/login_model.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:kodra/app/modules/auth/login/view/login_screen.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:kodra/app/views/network_error.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp( const CrazyApp(),);
}

class CrazyApp extends StatefulWidget {
  const CrazyApp({Key? key}) : super(key: key);

  @override
  State<CrazyApp> createState() => _CrazyAppState();
}

class _CrazyAppState extends State<CrazyApp> {
  bool _backViewOn = true;
  LoginModel? model;

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) =>Directionality(
    textDirection: LocalStorage.isAr? TextDirection.rtl:
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
              theme: ThemeData(primarySwatch: Colors.green,platform: TargetPlatform.iOS),
              home: HomeView()
          ),
      ),

    );
  }

  @override
  void initState() {
    model = LocalStorage.getUser;
    Get.log('data   =>' + (model?.idToken).toString());
    Connectivity().onConnectivityChanged.listen((event) async {
      if (await InternetConnectionChecker().hasConnection) {
        if (!_backViewOn) {
          setState(() {
            _backViewOn = false;
          });
          Get.to(
            () => const NetworkError(),
          );
        }
      }
    });
  }
}

//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
