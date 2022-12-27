
import 'package:get/get.dart';
import 'package:kodra/app/modules/home/controller/login_controller.dart';
import 'package:kodra/app/modules/user/controller/user_controller.dart';


class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

    Get.lazyPut<UserController>(
          () => UserController(),
    );

  }
}
