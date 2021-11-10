import 'package:e_commerce_app/view/view_auth/build_login_selection.dart';
import 'package:e_commerce_app/view/view_auth/build_singup_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LoginAndRegister extends StatefulWidget {
  const LoginAndRegister({Key? key}) : super(key: key);

  @override
  State<LoginAndRegister> createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  bool isSignUpScreen = false;

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
                top: -40,
                right: 0,
                left: 0,
                child: Container(
                  height: 330,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/splashh.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 230, left: 15),
                    // color: Color(0xFF95914C).withOpacity(.45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Welcome',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE57415),
                              ),
                              children: [
                                TextSpan(
                                  text: isSignUpScreen ? '' : ' Back',
                                  style: isSignUpScreen
                                      ? const TextStyle(
                                          fontFamily: 'DancingScript',
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFE57415),
                                        )
                                      : const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFE57415),
                                        ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        isSignUpScreen
                            ? const Text(
                                '   Signup to continue',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2A2524),
                                ),
                              )
                            : const Text(
                                '   Login to continue',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2A2524),
                                ),
                              ),
                      ],
                    ),
                  ),
                )),
            Positioned(
              top: (Get.height) / 3,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                height: Get.height * 0.6,
                width: Get.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // authController.toggleStatus();
                            setState(() {
                              isSignUpScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignUpScreen
                                      ? Colors.black
                                      : Colors.black45,
                                ),
                              ),
                              if (!isSignUpScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 55,
                                  height: 2,
                                  color: const Color(0xFFE57415),
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // authController.toggleStatus();
                            setState(() {
                              isSignUpScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUpScreen
                                      ? Colors.black
                                      : Colors.black38,
                                ),
                              ),
                              if (isSignUpScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 55,
                                  height: 2,
                                  color: const Color(0xFFE57415),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (isSignUpScreen) BuildSingUpSelection(),
                    if (!isSignUpScreen) BuildLoginSelection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
