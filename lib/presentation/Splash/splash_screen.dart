import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../config/app_color.dart';
import '../../config/text_style.dart';
import '../../widgets/icon_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async{
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.of(context).pushReplacementNamed('home');
    } else {
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IconApp(
              colorIcon: ColorTheme.primaryColor,
              colorBackground: ColorTheme.white,
            ),
            Text(
              'Lafyuu',
              style: TxtStyle.heading1.apply(color: ColorTheme.white),
            ),
          ],
        ),
      ),
    );
  }
}