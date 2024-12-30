import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';

import 'onboarding_model.dart';
//import 'package:flutter_svg/flutter_svg.dart';
class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({super.key,required this.onboardingModel});
  OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppImages.mosqueImage,
                  width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.height*0.3,

                  ),
                  // SvgPicture.asset(IslamiConsts.islami_image,
                  // width: 100,
                  //   height: 100,
                  // ),
                  //Image.asset('')
                ],
              ),
            ],
          ),
          //SvgPicture.asset(IslamiConsts.reading_image_svg)
          Image.asset(onboardingModel.imagePath,
          height: MediaQuery.of(context).size.height*.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(onboardingModel.text,style: TextStyle(
                //overflow: TextOverflow.ellipsis
              ),),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Text(onboardingModel.text2,style: TextStyle(
                fontSize:15
              ),)),
            ],
          ),
        ],
      ),
    );
  }
}
