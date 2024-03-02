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
    apiKey: 'AIzaSyDcAZIhk2y7wH6jgSXKXr88GG_VL5NJK0g',
    appId: '1:1049714382148:web:52d2601cdb52154739b311',
    messagingSenderId: '1049714382148',
    projectId: 'storeapp-fd97b',
    authDomain: 'storeapp-fd97b.firebaseapp.com',
    storageBucket: 'storeapp-fd97b.appspot.com',
    measurementId: 'G-F8LSKVG51G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIxTLgOTFZcEfuk7s7aO9pY4az9OOPDF8',
    appId: '1:1049714382148:android:a9cf81d35a7e989839b311',
    messagingSenderId: '1049714382148',
    projectId: 'storeapp-fd97b',
    storageBucket: 'storeapp-fd97b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFd_fx6QaZ5flVC-MM_xxRcG-CDAp0mGg',
    appId: '1:1049714382148:ios:45993423a4c5d4fe39b311',
    messagingSenderId: '1049714382148',
    projectId: 'storeapp-fd97b',
    storageBucket: 'storeapp-fd97b.appspot.com',
    iosBundleId: 'com.example.storeapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFd_fx6QaZ5flVC-MM_xxRcG-CDAp0mGg',
    appId: '1:1049714382148:ios:d98e080cdda4403a39b311',
    messagingSenderId: '1049714382148',
    projectId: 'storeapp-fd97b',
    storageBucket: 'storeapp-fd97b.appspot.com',
    iosBundleId: 'com.example.storeapp.RunnerTests',
  );
}