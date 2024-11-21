// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB7-gA9lOcBh31e36P1mjbXCALUImDkdYg',
    appId: '1:721629743086:web:e7c9cf794061ce4b6c70ff',
    messagingSenderId: '721629743086',
    projectId: 'drinks-82df8',
    authDomain: 'drinks-82df8.firebaseapp.com',
    storageBucket: 'drinks-82df8.appspot.com',
    measurementId: 'G-S8DZ9WFJ9V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjWyiGI4yVH10iF_IawCS4ApppJLjCokM',
    appId: '1:721629743086:android:78889140285bceb66c70ff',
    messagingSenderId: '721629743086',
    projectId: 'drinks-82df8',
    storageBucket: 'drinks-82df8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaFfcMr5dlkFEN5fYUYHJA2rOgESlrCME',
    appId: '1:721629743086:ios:8a71db4df87f8fa46c70ff',
    messagingSenderId: '721629743086',
    projectId: 'drinks-82df8',
    storageBucket: 'drinks-82df8.appspot.com',
    iosBundleId: 'com.krakert.drinks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaFfcMr5dlkFEN5fYUYHJA2rOgESlrCME',
    appId: '1:721629743086:ios:8a71db4df87f8fa46c70ff',
    messagingSenderId: '721629743086',
    projectId: 'drinks-82df8',
    storageBucket: 'drinks-82df8.appspot.com',
    iosBundleId: 'com.krakert.drinks',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7-gA9lOcBh31e36P1mjbXCALUImDkdYg',
    appId: '1:721629743086:web:44eb9ea90bb67bf86c70ff',
    messagingSenderId: '721629743086',
    projectId: 'drinks-82df8',
    authDomain: 'drinks-82df8.firebaseapp.com',
    storageBucket: 'drinks-82df8.appspot.com',
    measurementId: 'G-G0GFS29DGT',
  );
}