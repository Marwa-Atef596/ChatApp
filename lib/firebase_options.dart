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
    apiKey: 'AIzaSyBvQDgNBlGcd7AMpZfhVUPFA9p2jFTD0oo',
    appId: '1:665607724935:web:4867e29c71bc053d64fd22',
    messagingSenderId: '665607724935',
    projectId: 'chat-app-fb319',
    authDomain: 'chat-app-fb319.firebaseapp.com',
    storageBucket: 'chat-app-fb319.appspot.com',
    measurementId: 'G-G6WZKCW32X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzB62uctgUvTOKf1E8lmvTpvKSdSd2WwA',
    appId: '1:665607724935:android:9cdcb054d779214964fd22',
    messagingSenderId: '665607724935',
    projectId: 'chat-app-fb319',
    storageBucket: 'chat-app-fb319.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQTcKjX4wgjTTJBF88SJUcGRqtIKr5ujM',
    appId: '1:665607724935:ios:7a59dec469feca0a64fd22',
    messagingSenderId: '665607724935',
    projectId: 'chat-app-fb319',
    storageBucket: 'chat-app-fb319.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQTcKjX4wgjTTJBF88SJUcGRqtIKr5ujM',
    appId: '1:665607724935:ios:e41cd010e61e3c7464fd22',
    messagingSenderId: '665607724935',
    projectId: 'chat-app-fb319',
    storageBucket: 'chat-app-fb319.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
