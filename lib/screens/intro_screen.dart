import 'package:flutter/material.dart';
import 'package:islami_c13/ui/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/text_style.dart';


class IntroScreen extends StatefulWidget{
  static const String routeName = "onboarding";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}
List<String> imageName = ['first.png','second.png','third.png','fourth.png','fifth.png',];

List<String> title = ['','Welcome To Islami','Reading the Quran','Bearish','Holy Quran Radio',];

List<String> desc = ['Welcome To Islmi App',
  'We Are Very Excited To Have You In Our Community',
  'Read, and your Lord is the Most Generous',
  'Praise the name of your Lord, the Most High',
  'You can listen to the Holy Quran Radio through the application for free and easily',];

final pageController = PageController();
//int currentIndex =0 ;

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    void finish() async {
      final pref = await SharedPreferences.getInstance();
      await pref.setBool('ONBOARDING', false);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff202020),
          body: PageView.builder(
            controller: pageController,
            itemCount: imageName.length,

              itemBuilder: (BuildContext context, int index) {
              return   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Image.asset('assets/images/logo.png'),
                    SizedBox(height: 30,),
                    Image.asset(
                      'assets/images/${imageName[index]}',
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      title[index],
                      style: CustomTextStyle.title,

                    ),
                    SizedBox(height: 20,),
                    Text(
                      desc[index],
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.desc,
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Visibility(
                          visible: index == 0? false : true,
                          child: TextButton(
                              onPressed: (){
                               pageController.previousPage(
                                   duration: Duration(milliseconds: 500),
                                   curve: Curves.ease
                               );
                                },
                              child: Text(
                                'Back',
                                style: CustomTextStyle.textButton,
                              )),
                        ),
                        SizedBox(width: index == 0 ? 75 : 0,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: imageName.length,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xffE2BE7F),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              index == imageName.length-1 ? finish() :
                              pageController.nextPage(duration: Duration(
                                  milliseconds: 500),
                                  curve: Curves.ease
                              );


                            },
                            child: Text(
                              index == imageName.length-1 ? 'Finish' : 'Next',
                              style: CustomTextStyle.textButton,


                            )),

                      ],
                    )
                  ],
                ),

              );
            },

          ),
        ),
      );

  }
}