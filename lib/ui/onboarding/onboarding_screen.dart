import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/common/shared_preferences_utils.dart';
import 'package:islami_c13/ui/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_model.dart';
import 'onboarding_widget.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
static const String routeName='onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex=0;
  PageController controller=PageController();
  List<OnboardingModel> pages=[
    OnboardingModel(text: 'Welcome To Islami App',text2: '' ,imagePath:AppImages.greetingImage),
    OnboardingModel(text:'Welcome To Islami',text2: 'We Are Very Excited To Have You In Our Community'
        ,imagePath:AppImages.mosqueImage ),
    OnboardingModel(text:'Reading the Quran',text2: 'Read, and your Lord is the Most Generous' ,imagePath:AppImages.welcomeImage),
    OnboardingModel(text:'Bearish',text2: 'Praise the name of your Lord, the Most High' ,imagePath:AppImages.bearish),
    OnboardingModel(text: 'Holy Quran Radio',text2: 'You can listen to the Holy Quran Radio through the application for free and easily' ,
        imagePath:AppImages.radioImage),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      body: Column(
        children: [
          Expanded(child: PageView.builder(
            pageSnapping: false,
            controller: controller,
onPageChanged: (index){
  pageIndex=index;
  setState(() {

  });
},
              itemCount:pages.length,
              itemBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.all(20.0),
                child: OnboardingWidget(onboardingModel: pages[index],),
              ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Visibility(
                    visible: pageIndex>0?true:false,
                    child: TextButton(onPressed: (){
                      pageIndex--;
                      controller.jumpToPage(pageIndex);
                      setState(() {
                
                      });
                    }, child: Text('back'))),
              ),
             Expanded(
               child: Container(
                 //width: 200,
                 height: 5,
                 child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   itemCount: pages.length,
                   separatorBuilder: (context,index)=>SizedBox(width: 5,),
                   itemBuilder:(context,index)=>
                       PageContainer(index: index, pageIndex: pageIndex),
               
                   //     Row(
                   //   children: [
                   //     PageContainer(index: 0, pageIndex: pageIndex),
                   //     SizedBox(width: 5,),
                   //     PageContainer(index: 1, pageIndex: pageIndex),
                   //     SizedBox(width: 5,),
                   //     PageContainer(index: 2, pageIndex: pageIndex),
                   //     SizedBox(width: 5,),
                   //     PageContainer(index: 3, pageIndex: pageIndex),
                   //     SizedBox(width: 5,),
                   //     PageContainer(index: 4, pageIndex: pageIndex),
                   //   ],
                   // ),
                 ),
               ),
             ),
              Expanded(
                child: Visibility(
                    visible: pageIndex<5?true:false,
                    child: TextButton(onPressed: ()async{
                      SharedPreferences preference=await SharedPreferences.getInstance();
                      pageIndex++;
                      controller.jumpToPage(pageIndex);
                      setState(() {
                
                      });
                      if(pageIndex>=4)
                      {
                        preference.setBool(PrefsKeys.onBoardingView,true);
                        Navigator.pushReplacementNamed(context,HomeScreen.routeName);
                      }
                    }, child: Text(pageIndex>=4?'done':'next'))),
              ),


              ],
          )
        ],
      ),
    );
  }
}
class PageContainer extends StatelessWidget {
   PageContainer({super.key,required this.index,required this.pageIndex});
int index;
int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppColors.darkGray,
      height:5,
      width:pageIndex==index?15: 10,
      decoration: BoxDecoration(
        color:pageIndex==index?AppColors.primaryGold:Colors.grey ,
        borderRadius: BorderRadius.circular(50)
      ),
    );
  }
}
