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
    apiKey: 'AIzaSyBAtGQL_PlQ6mml0bVZ1L8GJGZppVOwj8o',
    appId: '1:922375395267:web:300edf2ddaf93df3608f76',
    messagingSenderId: '922375395267',
    projectId: 'nitsguard',
    authDomain: 'nitsguard.firebaseapp.com',
    storageBucket: 'nitsguard.appspot.com',
    measurementId: 'G-EK6W2Z8GS7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMS-X6CgWog6GUDbAuTi2SCNRSfY3znpQ',
    appId: '1:922375395267:android:c3eb8af19a987243608f76',
    messagingSenderId: '922375395267',
    projectId: 'nitsguard',
    storageBucket: 'nitsguard.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEhdeJn1PtsnbHnfinSAnqsRGRZldT2BI',
    appId: '1:922375395267:ios:692f712767309bde608f76',
    messagingSenderId: '922375395267',
    projectId: 'nitsguard',
    storageBucket: 'nitsguard.appspot.com',
    iosBundleId: 'com.example.darkPatternDetector',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEhdeJn1PtsnbHnfinSAnqsRGRZldT2BI',
    appId: '1:922375395267:ios:4d13c613c9e9d0ee608f76',
    messagingSenderId: '922375395267',
    projectId: 'nitsguard',
    storageBucket: 'nitsguard.appspot.com',
    iosBundleId: 'com.example.darkPatternDetector.RunnerTests',
  );
}
