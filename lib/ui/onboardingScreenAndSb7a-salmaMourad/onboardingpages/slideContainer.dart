
import 'package:flutter/material.dart';

import 'onboardingScreen.dart';

class slideContainer extends StatelessWidget {
  const slideContainer({
    super.key,
    required this.imagePath,
    required this.Text1,
    required this.Text2,
  });
  final String imagePath;
  final String Text1;
  final String Text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),

          Image.asset(
            imagePath,
            width: 350,
            height: 350,
            alignment: Alignment.center,
          ),
          // Spacer(flex: 1,),
          const SizedBox(
            height: 30,
          ),
          Text(
            Text1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(IntroPagesScreen.colorGold),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            Text2,
            style: TextStyle(
                color: Color(IntroPagesScreen.colorGold),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
