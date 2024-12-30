import 'package:flutter/material.dart';
import 'package:islami_c13/screens/intro_screen.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/home/home.dart';
import 'package:islami_c13/ui/home/tabs/tasbeh/tasbeh_tab.dart';
import 'package:islami_c13/ui/splash/splash_screen.dart';
import 'package:islami_c13/ui/sura_details/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColors.primaryGold),
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(
                  color: AppColors.primaryGold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryGold),
          useMaterial3: true,
          cardTheme: CardTheme(
              color: AppColors.primaryGold,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.primaryGold),
          textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
              bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
              titleMedium: TextStyle(
                  color: AppColors.primaryGold,
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),
      themeMode: ThemeMode.dark,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        TasbehTab.routeName: (_) => TasbehTab(),

      },
    );
  }
}
