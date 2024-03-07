import 'package:flutter/material.dart';
import 'package:fluttercli/Models/authModel.dart';
import 'package:fluttercli/Providers/authProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final userName = TextEditingController();
  final emailId = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context, listen: true);

    Future<void> signUpUser(BuildContext contextctx) async {
      final userAuth newUser = userAuth(
        userName: userName.text,
        email: emailId.text,
        password: password.text,
      );
      var isSignedUp = await userProvider.signUpUser(newUser);
      if (isSignedUp == "Success") {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('user', true);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isSignedUp.toString(),
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
        title: Text("Sign Up"),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: userName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your User Name",
                    label: Text("UserName")),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailId,
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
                          signUpUser(context);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          'Sign Up',
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
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
