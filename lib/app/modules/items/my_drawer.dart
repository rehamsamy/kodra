import 'package:flutter/material.dart';
import 'package:kodra/app/data/storage/local_storage.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
   MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
            height: 280,
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    showChangeLangDialog(context);
                  },
                  child: Container(
                    height: 80,
                    width: 200,
                    color: kGreyColor,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child:  const Center(
                      child: AppText(
                        'اللغة',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
            ),
                ),
            InkWell(
              onTap: (){
                setState(() {
                });
              },
              child: Container(
                width: 200,
                color: kGreyColor,
                height: 80,
                margin: const EdgeInsets.all(5),
                child:  const Center(
                  child: AppText(
                    'اللون',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                width: 200,
                color: kGreyColor,
                height: 80,
                margin: const EdgeInsets.all(5),
                child:  const Center(
                  child: AppText(
                    'تواصل معنا!',
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
