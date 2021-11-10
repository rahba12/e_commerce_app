import 'package:flutter/material.dart';

Widget buildTextField({
  IconData? icon,
  String? hintText,
  bool? isPassword,
  bool? isEmail,
  FormFieldValidator<String>? validator,
  void Function(String)? onSubmited,
  // FormFieldValidator<String>? onSave,
  TextEditingController? controller,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
            ),
            child: TextFormField(
              onFieldSubmitted: onSubmited,
              // onSaved: onSave,
              controller: controller,
              validator: validator,
              obscureText: isPassword!,
              keyboardType:
                  isEmail! ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  size: 18,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(
                    25,
                  )),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(
                    25,
                  )),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildPressButton(VoidCallback? onPressed) => Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange.shade200,
              Colors.red.shade300,
            ]),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );

// ElevatedButton(
// onPressed: () async {
// // remove userid
// removeUserId();
// String? userId = await removeUserId();
// print("User Id : $userId");
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (BuildContext context) => const LoginAndRegister(),
// ),
// (Route<dynamic> route) => false,
// );
// },
// child: const Text('Login'),
// ),
