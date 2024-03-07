import 'package:flutter/material.dart';
import 'package:fluttercli/Models/authModel.dart';
import 'package:fluttercli/Providers/authProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late userAuth userinfo;
  late bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    getUserdata();
  }

  Future<void> getUserdata() async {
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      var data = await userProvider.getUserData();
      if (data != null) {
        setState(() {
          userinfo = data;
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error Fetching Data',
            style: TextStyle(color: Colors.yellowAccent),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> logoutUser() async {
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    var logOutUser = await userProvider.logOutUser();
    if (logOutUser == "success") {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error Signing Out',
            style: TextStyle(color: Colors.yellowAccent),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Home Page"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {
                logoutUser();
              },
              child: Text(
                "LogOut",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: loading
              ? CircularProgressIndicator() // Show loading indicator
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email : ${userinfo.email}"),
                    Text("UserName : ${userinfo.userName}")
                  ],
                ),
        ),
      ),
    );
  }
}
