import 'package:flutter/material.dart';
import 'package:islami_c13/screens/intro_screen.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isShow = true;

  @override
  void initState() {
    super.initState();
    onBoarding();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(
        seconds: 2,
      ),
          () {
        Navigator.pushReplacementNamed(context, isShow? IntroScreen.routeName : HomeScreen.routeName);
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

  void onBoarding() async {
    WidgetsFlutterBinding.ensureInitialized();
    final pref = await SharedPreferences.getInstance();
    isShow = pref.getBool('ONBOARDING') ?? true;
  }
}