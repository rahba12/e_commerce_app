import 'package:e_commerce_app/app_theme/theme_controller.dart';
import 'package:e_commerce_app/core/view_model/auth_controller.dart';
import 'package:e_commerce_app/core/view_model/cart_controller.dart';
import 'package:e_commerce_app/core/view_model/home_control_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
  }
}
