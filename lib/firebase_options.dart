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
    apiKey: 'AIzaSyC5nIA8ju9i5KXi7W8vp7aWSrU6bfa9Fw0',
    appId: '1:893713331149:web:2053cf0480a35d2eac8a84',
    messagingSenderId: '893713331149',
    projectId: 'ecommerce-app-a46d8',
    authDomain: 'ecommerce-app-a46d8.firebaseapp.com',
    storageBucket: 'ecommerce-app-a46d8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9pCyKWiYMagFfh6Qh3DlplKajvGfb2Ik',
    appId: '1:893713331149:android:d2d2e9abb9c640a2ac8a84',
    messagingSenderId: '893713331149',
    projectId: 'ecommerce-app-a46d8',
    storageBucket: 'ecommerce-app-a46d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrfZZDakKMNNXsB1030-dn5XHbV8b7kLs',
    appId: '1:893713331149:ios:924f51619c2dad22ac8a84',
    messagingSenderId: '893713331149',
    projectId: 'ecommerce-app-a46d8',
    storageBucket: 'ecommerce-app-a46d8.appspot.com',
    iosClientId: '893713331149-35ae2l9e8flclgdf1qrieuou2pc2suds.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );
}
