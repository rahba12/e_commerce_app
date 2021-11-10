// ignore_for_file: avoid_print

import 'dart:async';
import 'package:e_commerce_app/view/home_view/home.dart';
import 'package:e_commerce_app/view/view_auth/login_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    String? userId = await getUserId();
    print("User Id : $userId");
    var _duration = const Duration(seconds: 2);
    if (userId != null) {
      //logged in
      return Timer(_duration, navigationPageHome);
    } else {
      return Timer(_duration, navigationPageWel);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Home();
        },
      ),
      (_) => false,
    );
  }

  void navigationPageWel() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const LoginAndRegister();
        },
      ),
      (_) => false,
    );
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    Get.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/bag.jpg',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.indigo.withOpacity(.3),
            width: Get.width,
            height: Get.height,
          ),
          const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
