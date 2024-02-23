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
    apiKey: 'AIzaSyCTClD9nozzO6xPVjzJI2fZkB4zv-35eHQ',
    appId: '1:718533802001:web:d8aa28a2ec7fb16306d9b0',
    messagingSenderId: '718533802001',
    projectId: 'flutterbreakfastapp',
    authDomain: 'flutterbreakfastapp.firebaseapp.com',
    databaseURL: 'https://flutterbreakfastapp-default-rtdb.firebaseio.com',
    storageBucket: 'flutterbreakfastapp.appspot.com',
    measurementId: 'G-P0TJMPTXM7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgFzFmmKWRQtDCXgZNyNuqmss2pZ7fXm0',
    appId: '1:718533802001:android:965a6074542e043006d9b0',
    messagingSenderId: '718533802001',
    projectId: 'flutterbreakfastapp',
    databaseURL: 'https://flutterbreakfastapp-default-rtdb.firebaseio.com',
    storageBucket: 'flutterbreakfastapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsSPQ4iuLqcL8ZgFiZiYGkyXOym2ankI0',
    appId: '1:718533802001:ios:6eb1b849f5585f8c06d9b0',
    messagingSenderId: '718533802001',
    projectId: 'flutterbreakfastapp',
    databaseURL: 'https://flutterbreakfastapp-default-rtdb.firebaseio.com',
    storageBucket: 'flutterbreakfastapp.appspot.com',
    iosBundleId: 'com.example.testDrive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsSPQ4iuLqcL8ZgFiZiYGkyXOym2ankI0',
    appId: '1:718533802001:ios:41256aa9baa52a6d06d9b0',
    messagingSenderId: '718533802001',
    projectId: 'flutterbreakfastapp',
    databaseURL: 'https://flutterbreakfastapp-default-rtdb.firebaseio.com',
    storageBucket: 'flutterbreakfastapp.appspot.com',
    iosBundleId: 'com.example.testDrive.RunnerTests',
  );
}
