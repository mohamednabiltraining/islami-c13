import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/common/shared_preferences_utils.dart';
import 'package:islami_c13/ui/home/home.dart';
import 'package:islami_c13/ui/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 late SharedPreferences preferences;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPref();
  }
  setPref()async
  {
    preferences=await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () {
        Navigator.pushReplacementNamed(context,preferences.containsKey(PrefsKeys.onBoardingView)?
        HomeScreen.routeName:OnboardingScreen.routeName);
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
