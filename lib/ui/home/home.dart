import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/common/custom_scaffold_container.dart';
import 'package:islami_c13/ui/home/home_utils.dart';
import 'package:islami_c13/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_c13/ui/home/tabs/prayers/prayers_tab.dart';
import 'package:islami_c13/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_c13/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_c13/ui/home/tabs/tasbeh/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldContainer(
        child: SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: generateBottomNavItems([
            AppImages.icQuran,
            AppImages.icHadeth,
            AppImages.icSebha,
            AppImages.icRadio,
            AppImages.icTime,
          ]),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Image.asset(
                AppImages.homeLogo,
              ),
            ),
            Expanded(child: tabs[selectedIndex])
          ],
        ),
      ),
    ));
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    PrayersTab(),
  ];
}
