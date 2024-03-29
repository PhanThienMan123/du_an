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
    apiKey: 'AIzaSyDtF_FiOmBFboy1JvfsmaTaAv8aooSEEy8',
    appId: '1:429421044304:web:83cba512832b61e9f82755',
    messagingSenderId: '429421044304',
    projectId: 'foodkfc-8e803',
    authDomain: 'foodkfc-8e803.firebaseapp.com',
    storageBucket: 'foodkfc-8e803.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD52GRL52GoZ0t_pI3bOBT5jC3rKnlICVg',
    appId: '1:429421044304:android:2fea5c6da01c72aff82755',
    messagingSenderId: '429421044304',
    projectId: 'foodkfc-8e803',
    storageBucket: 'foodkfc-8e803.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ9lcW_pVHv8YUjWy6uLAvdqPayKqT_D8',
    appId: '1:429421044304:ios:63c1084aa468ada4f82755',
    messagingSenderId: '429421044304',
    projectId: 'foodkfc-8e803',
    storageBucket: 'foodkfc-8e803.appspot.com',
    iosBundleId: 'com.example.duAn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ9lcW_pVHv8YUjWy6uLAvdqPayKqT_D8',
    appId: '1:429421044304:ios:3fb4f1a950498035f82755',
    messagingSenderId: '429421044304',
    projectId: 'foodkfc-8e803',
    storageBucket: 'foodkfc-8e803.appspot.com',
    iosBundleId: 'com.example.duAn.RunnerTests',
  );
}
