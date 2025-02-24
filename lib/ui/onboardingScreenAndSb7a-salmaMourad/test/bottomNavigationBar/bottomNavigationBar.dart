import 'package:flutter/material.dart';

import '../../../../sb7a/sb7aPages/Sb7aPageScreen.dart';
import 'test.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int currentPage = 0;
  List<Widget> widgets = [
    Sb7aPage(),
    testForNavBar(),
    testForNavBar(),
    testForNavBar(),
    testForNavBar()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          // fixedColor: Color(0xffE2BE7F),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          backgroundColor: Color(0xffE2BE7F),
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE2BE7F),
              icon: ImageIcon(AssetImage('assets/onboardingScreenImages_Icons/icons/sb7a.png')),
              label: 'sb7a',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE2BE7F),
              icon: ImageIcon(AssetImage('assets/onboardingScreenImages_Icons/icons/Page-1.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE2BE7F),
              icon: ImageIcon(AssetImage('assets/onboardingScreenImages_Icons/icons/Vector.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE2BE7F),
              icon:
                  ImageIcon(AssetImage('assets/onboardingScreenImages_Icons/icons/radio-svgrepo-com 1.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xffE2BE7F),
              icon: ImageIcon(AssetImage('assets/onboardingScreenImages_Icons/icons/last.png')),
              label: '',
            ),
          ]),
    );
  }
}

void main() => runApp(MaterialApp(home: BottomNavigationBarPage()));
