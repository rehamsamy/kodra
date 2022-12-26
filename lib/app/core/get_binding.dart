
import 'package:get/get.dart';
import 'package:kodra/app/modules/home/controller/login_controller.dart';


class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

  }
}
