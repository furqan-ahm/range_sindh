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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCls23HpaViGtUJG8rq_wXHKP1LnlIGye8',
    appId: '1:648104104452:web:2763463c86269d277b1b51',
    messagingSenderId: '648104104452',
    projectId: 'rang-e-sindh',
    authDomain: 'rang-e-sindh.firebaseapp.com',
    storageBucket: 'rang-e-sindh.appspot.com',
    measurementId: 'G-VGR4LTZFQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBho4LnwT3ouq2-lCE_JnlgPxK1NDgPoQg',
    appId: '1:648104104452:android:9f796bbc71f69cc67b1b51',
    messagingSenderId: '648104104452',
    projectId: 'rang-e-sindh',
    storageBucket: 'rang-e-sindh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUXiM6sJU--cgGwJqN_rJBlXjSSAuTd_g',
    appId: '1:648104104452:ios:1be8e822b87aa3f07b1b51',
    messagingSenderId: '648104104452',
    projectId: 'rang-e-sindh',
    storageBucket: 'rang-e-sindh.appspot.com',
    iosBundleId: 'com.example.rangeSindh',
  );
}
