import 'package:e_commerce_app/core/view_model/auth_controller.dart';
import 'package:e_commerce_app/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';

class BuildSingUpSelection extends GetWidget<AuthController> {
  BuildSingUpSelection({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyRegister,
      child: Column(
        children: [
          buildTextField(
            icon: Typicons.user,
            hintText: 'User Name',
            isPassword: false,
            isEmail: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'User Name must not be empty';
              }
              return null;
            },
            controller: userNameController,
          ),
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
            controller: emailRegisterController,
          ),
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
            controller: passwordRegisterController,
          ),
          SignInButton(
            Buttons.Google,
            text: "Sign up with Google",
            onPressed: () {},
          ),
          SignInButton(
            Buttons.Facebook,
            text: "Sign up with Facebook",
            onPressed: () {},
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: buildPressButton(() async {
              if (formKeyRegister.currentState!.validate()) {
                controller.createAccountWithEmailAndPassword(
                    email: emailRegisterController.text,
                    password: passwordRegisterController.text,
                    name: userNameController.text);
              }
            }),
          )
        ],
      ),
    );
  }
}
