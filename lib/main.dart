import 'package:flutter/material.dart';
import 'package:quran/home.dart';
import 'package:quran/onboard_screen.dart';
import 'package:quran/splash.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash2(),
    );
  }
}

