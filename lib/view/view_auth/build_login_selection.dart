import 'package:e_commerce_app/core/view_model/auth_controller.dart';
import 'package:e_commerce_app/shared/components.dart';
import 'package:e_commerce_app/view/home_view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';

class BuildLoginSelection extends GetWidget<AuthController> {
  BuildLoginSelection({Key? key}) : super(key: key);

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyLogin,
      child: Column(
        children: [
          buildTextField(
              icon: Typicons.mail,
              hintText: 'Email Address',
              isPassword: false,
              isEmail: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email must not be empty';
                }
                return null;
              },
              controller: emailLoginController),
          buildTextField(
            icon: Typicons.lock,
            hintText: 'Password',
            isPassword: true,
            isEmail: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password isn\'t correct';
              }
              return null;
            },
            controller: passwordLoginController,
            onSubmited: (value) => login(),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 5,
          ),
          SignInButton(
            Buttons.Google,
            text: "Sign in with Google",
            onPressed: () {
              controller.googleLoginMethod();
            },
          ),
          SignInButton(
            Buttons.Facebook,
            text: "Sign in with Facebook",
            onPressed: () {
              controller.facebookLoginMethod();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: buildPressButton(() async {
              login();
            }),
          ),
        ],
      ),
    );
  }

  void login() {
    if (formKeyLogin.currentState!.validate()) {
      controller.signInWithEmailAndPassword(
        email: emailLoginController.text,
        password: passwordLoginController.text,
      );
      Get.offAll(Home());
    }
  }
}
