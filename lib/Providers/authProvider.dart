import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercli/Controller/authController.dart';
import 'package:fluttercli/Models/authModel.dart';

class AuthProvider extends ChangeNotifier {
  late AuthenticationService authApi = AuthenticationService();

  Future<String?> signUpUser(userAuth userAuthData) async {
    String? userData = "";
    try {
      var result = await authApi.registerWithEmailPassword(
          userAuthData.email.toString(),
          userAuthData.password.toString(),
          userAuthData.userName.toString());
      print("hhhhhhhhhh $result");
      userData = result;
    } on FirebaseAuthException catch (e) {
      print("Error fetching user data: $e");
      userData = e.message;
    }
    return userData;
  }

  Future<String?> SignInUser(userAuth userAuthData) async {
    String? userData = "";
    try {
      var result = await authApi.signInWithEmailPassword(
          userAuthData.email.toString(), userAuthData.password.toString());
      userData = result;
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return userData;
  }

  Future<String?> logOutUser() async {
    String? result = "";
    try {
      result = await authApi.signOut();
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return result;
  }

  Future<dynamic> getUserData() async {
    try {
      var result = await authApi.getUserProfile();
      var userData = result;
      return userData;
    } on FirebaseAuthException catch (e) {
      print("Error fetching user data: $e");
      return e.message;
    }
  }
}
