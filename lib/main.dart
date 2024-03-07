import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttercli/Providers/authProvider.dart';
import 'package:fluttercli/Screens/HomeScreen.dart';
import 'package:fluttercli/Screens/LoginScreen.dart';
import 'package:fluttercli/Screens/SignUpScreen.dart';
import 'package:fluttercli/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        routes: {
          "/login": (ctx) {
            return LoginScreen();
          },
          "/signup": (ctx) {
            return SignUpScreen();
          },
          "/home": (ctx) {
            return HomeScreen();
          },
        },
      ),
    );
  }
}
