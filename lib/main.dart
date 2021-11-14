import 'package:e_commerce_app/app_theme/themes.dart';
import 'package:e_commerce_app/binding/binding.dart';
import 'package:e_commerce_app/core/view_model/cart_controller.dart';
import 'package:e_commerce_app/translations/codegen_loader.g.dart';
import 'package:e_commerce_app/view/home_view/home.dart';
import 'package:e_commerce_app/view/product_details/product_details.dart';
import 'package:e_commerce_app/view/shipping_address_view/shipping_address_view.dart';
import 'package:e_commerce_app/view/view_auth/build_login_selection.dart';
import 'package:e_commerce_app/view/view_auth/build_singup_selection.dart';
import 'package:e_commerce_app/view/view_auth/splash_screen.dart';
import 'package:e_commerce_app/view/view_auth/login_register.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Get.put(CartController());

  //firebase
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
      path: 'assets/translations/',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,

      // Toggle between dark and light

      getPages: [
        GetPage(name: '/splash', page: () => const Splash()),
        GetPage(
            name: '/LoginAndRegister', page: () => const LoginAndRegister()),
        GetPage(name: '/login', page: () => BuildLoginSelection()),
        GetPage(name: '/signup', page: () => BuildSingUpSelection()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/shipping_address', page: () => const ShippingAddress()),
      ],
      home: const Splash(),
    );
  }
}
