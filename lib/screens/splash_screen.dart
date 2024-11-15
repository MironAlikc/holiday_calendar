import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      //() => Navigator.of(context).pushReplacementNamed('/home_screen'),
      () => Navigator.of(context).pushReplacementNamed('/auth'),

      // Navigator.of(context).pushNamed(
      //   MainNavigationRouteNames.homeScreen,
      //   arguments: true,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'holiday calendar'.toUpperCase(),
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Lobster',
                  ),
                  colors: [
                    const Color(0xFF0abab5),
                    Colors.red,
                    Colors.green,
                    Colors.white,
                    Colors.amber,
                    Colors.black
                  ],
                )
              ],
              repeatForever: true,
            ),
            Lottie.asset('assets/json/notebook.json'),
          ],
        ),
      ),
    );
  }
}
