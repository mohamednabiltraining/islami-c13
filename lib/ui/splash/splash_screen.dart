import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/home/home.dart';

import '../onboardingScreenAndSb7a-salmaMourad/onboardingpages/onboardingScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () {
        Navigator.pushNamed(context, IntroPagesScreen.routeName);
      },
    );
    return Scaffold(
      body: Image.asset(
        AppImages.splashImage,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
