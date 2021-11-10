import 'package:e_commerce_app/app_theme/theme_controller.dart';
import 'package:e_commerce_app/core/view_model/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ThemeController());
  }
}
