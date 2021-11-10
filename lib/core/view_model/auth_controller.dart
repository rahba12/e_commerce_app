// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleLogin = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  // using firebase and google to sign in //
  void googleLoginMethod() async {
    // how to sign in with google
    final GoogleSignInAccount? googleUser = await _googleLogin.signIn();
    print(googleUser);

    // 3- how to get idToken & accessToken?
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    // 2- how to get credential?
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    // how to send your data from google sign in to firebase? //
    // 1- we will use signInWithCredential
    await _firebaseAuth.signInWithCredential(credential);
  }

  // login with facebook  //
  void facebookLoginMethod() async {
    // how to sign in with facebook
    LoginResult result = await _facebookAuth.login();

    // Create the access token
    final accessToken = result.accessToken!.token;

    // Create a credential from the access token
    final OAuthCredential facebookCredential =
        FacebookAuthProvider.credential(accessToken);

    await _firebaseAuth.signInWithCredential(facebookCredential);
  }

  // sign in with email and password
  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      saveUserId(value.user!.uid);
    }).catchError((error) {
      Get.snackbar('Error login account', error.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    });
  }

  saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userId);
  }

  // signUp With Email And Password
  void createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      createUserCollection(
        email: email,
        name: name,
        uid: value.user!.uid,
      );
    }).catchError((error) {
      Get.snackbar('Error register account', error.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    });
  }

  void createUserCollection({
    required String name,
    required String email,
    required String uid,
    bool? isEmailVerified,
    String? phone,
    String? profileImage,
  }) {
    UserModel model = UserModel(
      email: email,
      uid: uid,
      name: name,
      phone: phone,
      profileImage: profileImage,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toJson())
        .then((value) {})
        .catchError((error) {});
  }
}
