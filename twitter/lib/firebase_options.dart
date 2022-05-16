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
    apiKey: 'AIzaSyAgm9IbCyP0d8Yrc-NLkvSpIAg3vZ86Q3M',
    appId: '1:1051899152849:web:c46b696551c2fe88ef78f0',
    messagingSenderId: '1051899152849',
    projectId: 'holberton-twitter-clone',
    authDomain: 'holberton-twitter-clone.firebaseapp.com',
    storageBucket: 'holberton-twitter-clone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzxnMuK1SPcQ1TWnG2jsUrzlYcyRD5TvM',
    appId: '1:1051899152849:android:7968eee4dfe5e058ef78f0',
    messagingSenderId: '1051899152849',
    projectId: 'holberton-twitter-clone',
    storageBucket: 'holberton-twitter-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM--1FLKvZyCSJpmZyw-8EHE5jQVmquX4',
    appId: '1:1051899152849:ios:89ee000fbde38015ef78f0',
    messagingSenderId: '1051899152849',
    projectId: 'holberton-twitter-clone',
    storageBucket: 'holberton-twitter-clone.appspot.com',
    iosClientId: '1051899152849-a76prt3c0669vioajms91nbklr6d5su9.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitter',
  );
}
