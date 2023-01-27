import 'package:flutter/material.dart';
import 'package:quran/home.dart';
import 'package:quran/onboard_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds:OnBoardScreen(),
      title:  const Text('قران كريم', style: TextStyle(
        fontFamily: 'Kitab',
        fontSize: 35
      ),),
      image:  Image.asset('assets/images/splash.png',width: 500,height: 500,),
      loadingText: Text("Created By Ahmed Osman"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}