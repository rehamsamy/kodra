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
            height: 280,
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
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
              onTap: (){},
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
}
