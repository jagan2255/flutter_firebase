import 'package:flutter/material.dart';
import 'package:fluttercli/Models/authModel.dart';
import 'package:fluttercli/Providers/authProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context, listen: true);
    isTokenPresent(context);

    signInUser() async {
      var mailId = email.text;
      var psd = password.text;

      userAuth newauth = userAuth(email: mailId, password: psd);

      var result = await userProvider.SignInUser(newauth);
      if (result == "Success") {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('user', true);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.toString(),
              style: TextStyle(color: Colors.yellowAccent),
            ),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your email id",
                  label: Text("Email Id")),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your password",
                label: Text("Password"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        signInUser();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> isTokenPresent(ctx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isPresent = await prefs.getBool('user');
    if (isPresent != null) {
      Navigator.of(ctx).pushReplacementNamed('/home');
    }
  }
}
