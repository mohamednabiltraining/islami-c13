import 'package:flutter/material.dart';
import 'package:islami_c13/ui/home/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bottomNavigationBar/bottomNavigationBar.dart';
import 'slideContainer.dart';

class IntroPagesScreen extends StatefulWidget {
  static int colorGold = 0xffE2BE7F;
  static const String routeName = 'home';

  @override
  State<IntroPagesScreen> createState() => _IntroPagesScreenState();
}

class _IntroPagesScreenState extends State<IntroPagesScreen> {
  PageController controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                lastPage = (value == 4);
              });
            },
            controller: controller,
            children: const [
              slideContainer(
                imagePath: 'assets/onboardingScreenImages_Icons/images/intro.png',
                Text1: '',
                Text2: 'Welcome To Islmi App',
              ),
              slideContainer(
                imagePath: 'assets/onboardingScreenImages_Icons/images/msgd.png',
                Text1: 'Welcome To Islami',
                Text2: 'We Are Very Excited To Have You In Our Community',
              ),
              slideContainer(
                imagePath: 'assets/onboardingScreenImages_Icons/images/mos7af.png',
                Text1: 'Reading the Quran',
                Text2: 'Read, and your Lord is the Most Generous',
              ),
              slideContainer(
                imagePath: 'assets/onboardingScreenImages_Icons/images/do3aa.png',
                Text1: 'Bearish',
                Text2: 'Praise the name of your Lord, the Most High',
              ),
              slideContainer(
                imagePath: 'assets/onboardingScreenImages_Icons/images/radio.png',
                Text1: 'Holy Quran Radio',
                Text2:
                    'You can listen to the Holy Quran Radio through the application for free and easily',
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Image.asset(
              'assets/onboardingScreenImages_Icons/images/Logo@3x.png',
              height: 160,
              alignment: Alignment.center,
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                // controller.hasClients && controller.page == 0
                //     ? SizedBox() 
                //     : 
                  GestureDetector(
                      onTap: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Color(IntroPagesScreen.colorGold),
                        ),
                      )),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Color(IntroPagesScreen.colorGold),
                      dotWidth: 7.0,
                      dotHeight: 8.0,
                    ),
                  ),
                  lastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Color(IntroPagesScreen.colorGold),
                            ),
                          ))
                      : GestureDetector(
                          onTap: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Color(IntroPagesScreen.colorGold),
                            ),
                          )),
                ],
              ))
        ],
      ),
    );
  }
}
