import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttercli/Models/authModel.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<String?> signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success"; // Return null if successful
    } on FirebaseAuthException catch (e) {
      print("Eroor $e");
      var message = e.message;
      return message;
    }
  }

  // Register with email and password
  Future<String?> registerWithEmailPassword(
      String email, String password, String UserName) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("soln $result");
      userAuth profile = userAuth(
          id: _auth.currentUser?.uid,
          email: _auth.currentUser?.email,
          userName: UserName);
      await db
          .collection("Users")
          .doc(_auth.currentUser?.uid)
          .collection("profile")
          .doc(_auth.currentUser?.uid)
          .set(profile.toJson());

      return "Success";
    } on FirebaseAuthException catch (e) {
      print("Eroor $e");
      var message = e.message;
      return message;
    }
  }

  // Sign out
  Future<String?> signOut() async {
    var result;
    try {
      await _auth.signOut();
      result = "success";
    } catch (err) {
      result = "Error";
    }
    return result;
  }

  Future<dynamic> getUserProfile() async {
    try {
      var userId = _auth.currentUser?.uid;
      var userDoc = await db
          .collection("Users")
          .doc(userId)
          .collection("profile")
          .doc(userId)
          .get(GetOptions(source: Source.serverAndCache));

      print("start");
      print(userDoc.exists);
      print("end");
      var UserName;
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        print("start");
        print(userData);
        print("end");
        UserName = userData['userName'];
      } else {
        UserName = null;
      }

      userAuth userdata = userAuth(
        id: _auth.currentUser?.uid,
        userName: UserName,
        email: _auth.currentUser?.email,
      );
      return userdata;
    } catch (e) {
      print("Error $e");
      var message = e.toString();
      return message;
    }
  }
}
