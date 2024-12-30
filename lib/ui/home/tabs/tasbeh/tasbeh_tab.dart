
import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget{
  static const String routeName = "sebha";

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}
int  numCounter = 0;
int  textCounter = 0;
List<String> prayerTextList = ['سبحان الله','الحمد لله','لا اله الا الله','الله اكبر'];
double angle = 0;
class _TasbehTabState extends State<TasbehTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/sebha_background.png',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 15,),
                  Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36
                    ),
                  ),
                  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (numCounter < 33) {
                          numCounter++;
                          angle += 0.19;
                        } else {
                          numCounter = 0;
                          angle = 0;
                          if (textCounter < 3) {
                            textCounter++;
                          } else {
                            textCounter = 0;
                          }
                        }
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Transform.rotate(
                            angle: angle,
                            child: Image.asset(
                              'assets/images/sebha.png',
                              height: 350,

                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Column(
                              children: [
                                Text(
                                  prayerTextList[textCounter],
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36
                                  ),
                                ),

                                SizedBox(height: 10,),
                                Text(
                                  '$numCounter',
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}