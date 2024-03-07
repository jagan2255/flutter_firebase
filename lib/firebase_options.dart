// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcx43kAWvmP5GTcOUw_PN4x_cms69QcE4',
    appId: '1:561952666587:web:70bfc32ad48a52935fadfe',
    messagingSenderId: '561952666587',
    projectId: 'flutterauth-e745d',
    authDomain: 'flutterauth-e745d.firebaseapp.com',
    storageBucket: 'flutterauth-e745d.appspot.com',
    measurementId: 'G-LTETQD5PSB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1P3qxOp7G3TPb9jChOi2-aFxJDpqKQK8',
    appId: '1:561952666587:android:4b24ba79f179a9de5fadfe',
    messagingSenderId: '561952666587',
    projectId: 'flutterauth-e745d',
    storageBucket: 'flutterauth-e745d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAag6LkUF14JdOplWjWebTo8xQG8JKfPho',
    appId: '1:561952666587:ios:b1e7052022dfc8d85fadfe',
    messagingSenderId: '561952666587',
    projectId: 'flutterauth-e745d',
    storageBucket: 'flutterauth-e745d.appspot.com',
    iosBundleId: 'com.example.fluttercli',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAag6LkUF14JdOplWjWebTo8xQG8JKfPho',
    appId: '1:561952666587:ios:08b9a35d984823565fadfe',
    messagingSenderId: '561952666587',
    projectId: 'flutterauth-e745d',
    storageBucket: 'flutterauth-e745d.appspot.com',
    iosBundleId: 'com.example.fluttercli.RunnerTests',
  );
}