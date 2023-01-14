import 'package:flutter/material.dart';
import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/modules/disability/view/disability_view.dart';
import 'package:kodra/app/modules/items/my_drawer.dart';
import 'package:kodra/app/modules/user/view/user_view.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  bool isLogin = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.settings,color: kPurpleColor,size: 40,),
            onPressed: () => _key.currentState!.openDrawer(),
          ),
          actions: [
            // IconButton(onPressed: (){}, icon:  const Icon(Icons.camera_alt,color: kPurpleColor,size: 35,))
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:  BoxDecoration(color: kBackgroundColor),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 20,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration:   BoxDecoration(
                        gradient:LinearGradient(
                          colors: [
                            kPurpleColor,
                            kUnSelectedColor
                          ]
                        ),

                      ),
                      child:
                      Image.asset(
                        'assets/images/free_icon.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Card(
                  elevation: 20,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  color: kAuthGreyColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0,horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: AppProgressButton(
                            isBordered: isLogin ? false : true,
                            backgroundColor: isLogin ? kPurpleColor : Colors.white,
                            textColor: isLogin ? Colors.white : kPurpleColor,
                            // text: 'ذوي الاعاقة السمعية',
                            onPressed: (AnimationController animationController) {
                              animationController.forward();
                              Future.delayed(const Duration(seconds: 5));
                              setState(() {
                                isLogin = true;
                              });
                              Get.off(()=>const DisabilityView(),binding: GetBinding());
                              animationController.reverse();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Icon(Icons.perm_identity,size: 40,color:  isLogin ? Colors.white : kPurpleColor),
                                AppText('hearing_impairment'.tr,color:  isLogin ? Colors.white : kPurpleColor,fontSize: 18,),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40,),
                        SizedBox(
                          width: Get.width,
                          child: AppProgressButton(
                            isBordered: isLogin ? true : false,
                            textColor: isLogin ? kPurpleColor : Colors.white,
                            backgroundColor: isLogin ? Colors.white : kPurpleColor,
                            // text: 'المستخدم',
                            onPressed: (AnimationController animationController) {
                              animationController.forward();
                              Future.delayed(const Duration(seconds: 5));
                              setState(() {
                                isLogin = false;
                              });
                              Get.off(()=>UserView(),binding: GetBinding());
                              animationController.reverse();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Icon(Icons.perm_identity,size: 40,color:isLogin ? kPurpleColor : Colors.white ,),
                                AppText('user'.tr,color:  isLogin ? kPurpleColor : Colors.white,fontSize: 18,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer:  MyDrawer(),

    );
  }
}
