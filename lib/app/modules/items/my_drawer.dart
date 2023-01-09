import 'package:flutter/material.dart';
import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:kodra/app/modules/auth/view/login_view.dart';
import 'package:kodra/app/modules/items/send_message.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _notifier,
      builder: (context,mode,_) {
        return Container(
          width: 200,
          height: double.infinity,
          color: kBackgroundDarkColor.withOpacity(0.7),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 380,
                color: Colors.white,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showChangeLangDialog(context);
                      },
                      child: Container(
                        height: 80,
                        width: 200,
                        color: kGreyColor,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: AppText(
                            'language'.tr,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _notifier.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                        });
                      },
                      child: Container(
                        width: 200,
                        color: kGreyColor,
                        height: 80,
                        margin: const EdgeInsets.all(5),
                        child: Center(
                          child: AppText(
                            'color'.tr,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(() => SendMessageView());
                      },
                      child: Container(
                        width: 200,
                        color: kGreyColor,
                        height: 80,
                        margin: const EdgeInsets.all(5),
                        child: Center(
                          child: AppText(
                            'contact_us'.tr,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        LocalStorage.signOut();
                        Get.offAll(() => LoginView(), binding: GetBinding());
                      },
                      child: Container(
                        width: 200,
                        color: kGreyColor,
                        height: 80,
                        margin: const EdgeInsets.all(5),
                        child: Center(
                          child: AppText(
                            'sign_out'.tr,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }
    );
  }

  void showChangeLangDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Center(
            child: AppText(
          'change_lang'.tr,
          color: kPrimaryColor,
        )),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: LayoutBuilder(
              builder: (_, cons) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: cons.maxWidth * 0.8,
                        height: 40,
                        child: AppProgressButton(
                          backgroundColor: kPrimaryColor,
                          radius: 5,
                          onPressed: (val) {
                            Get.back();
                            onChangeLang('ar');
                          },
                          child: const AppText(
                            'العربيه',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: cons.maxWidth * 0.8,
                        child: AppProgressButton(
                          backgroundColor: kPrimaryColor,
                          radius: 5,
                          onPressed: (val) {
                            Get.back();
                            onChangeLang('en');
                          },
                          child: const AppText(
                            'English',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }

  onChangeLang(String lang) async {
    await Get.updateLocale(Locale(lang));
    LocalStorage.saveLocale(lang);
  }

  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('us')},
    {'name': 'العربية', 'locale': const Locale('ar')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
}
