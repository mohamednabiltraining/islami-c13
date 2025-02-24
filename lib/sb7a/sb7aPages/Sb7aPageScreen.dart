import 'package:flutter/material.dart';

class Sb7aPage extends StatefulWidget {
  @override
  _Sb7aPageState createState() => _Sb7aPageState();
}

class _Sb7aPageState extends State<Sb7aPage> {
  double _angle = 0;
  int counter = 0;
  List<String> t = [
    'سبحان الله',
    'الله اكبر',
    'الحمد لله',
    "استغفر الله",
    "لا اله الا الله"
  ];
  int listCounter = 0;
  String text = "سبحان الله";

  void _rotateImage() {
    setState(() {
      _angle += 0.03; 
      counter++; 

      if (counter == 33) {
        counter = 0; 
        listCounter++; 

        if (listCounter >= t.length) {
          listCounter = 0; 
        }

        text = t[listCounter]; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Container(
      //   height: double.infinity,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/onboardingScreenImages_Icons/images/Background@3x.png'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Image.asset('assets/onboardingScreenImages_Icons/images/Logo@3x.png', width: 270, height: 200),
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: _rotateImage,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedRotation(
                        turns: _angle,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          'assets/onboardingScreenImages_Icons/images/Sebha@3x.png',
                          width: 395,
                          height: 395,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Text(
                            '$text',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$counter',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
