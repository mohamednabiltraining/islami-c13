import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> with SingleTickerProviderStateMixin{
 late AnimationController controller;
 late Animation<double> animation;
  double top=0;
  double left=0;
  Duration duration=Duration(milliseconds: 100);
  double width=300,height=300;
  List<String> azkar=['سبحان الله','الحمد لله','الله أكبر','لا إله إلا الله','سبحان الله وبحمده',
    'سبحان الله العظيم','لا حول ولا قوة إلا بالله','رب اغفر لي وتب علي'];
 late int index;
 int counter=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index=Random().nextInt(azkar.length);
    controller=AnimationController(vsync:this, duration: Duration(seconds:60));
    animation=Tween<double>(
      begin:0 ,
      end:2*pi ,
    ).animate(controller);
    //controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    //color: Colors.red,
                    width:73,
                    height:100,
                    child: Image.asset(
                        //height:250,
                      width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                        AppImages.sebhaHead),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    //alignment: Alignment.center,
                   // width:width,
                   // height:height,
                   //  decoration: BoxDecoration(
                   //    image: DecorationImage(image: AssetImage(
                   //        AppImages.sebhaBgImage)),
                   //      //color: Colors.green,
                   //      shape: BoxShape.circle,
                   //      //border: Border.all(color: Colors.red, width: 4)),
                   //  ),
                   //   duration:duration,
                     child:AnimatedBuilder(
                         animation: animation,
                         builder:(context,child)=> Transform.rotate(
                             angle: animation.value,
                             child: Image.asset(AppImages.sebhaBgImage))),
                  ),
                  InkWell(
                    onTap: (){
                      //controller.repeat();
                      counter++;
                      if(counter%2!=0)
                      {
                        controller.repeat();
                      }
                      if(counter%2==0)
                      {
                        controller.stop();
                      }
                      if(counter==33)
                      {
                        index=Random().nextInt(azkar.length);
                        counter=0;
                        controller.stop();
                      }
                      setState(() {

                      });
                    },
                    child: Column(
                      children: [
                        Text(azkar[index]),
                        Text('$counter')
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // FloatingActionButton(onPressed: (){
        //   height-=10;
        //   width-=10;
        //   setState(() {
        //
        //   });
        // },
        // child: Icon(Icons.animation),
        // )
      ],
    );

  }
  move()async{
    height--;
    width--;
   // print('$top  $left');
    await Future.delayed(Duration(milliseconds:100));
    setState(() {

    });
  }
  Widget sebhaVectorWidget()
  {
    return  Container(
      width:40,
      height:40,
      decoration: BoxDecoration(
        gradient:RadialGradient(colors: [
          Color(0xffFFCF7C),
          Color(0xffDBAC5B),
          Color(0xffB6893A),
          Color(0xff77623D),

        ]),
          //color: Colors.orange,
          borderRadius: BorderRadius.circular(50)
      ),
    );
  }
  Widget positionedSebha(double top,double left)
  {
    return Positioned(
      top:top,
      left:left,
      child:sebhaVectorWidget(),
    );
  }
  List<Widget> leftSebhaCircle(double top,double left)
  {
    return List.generate(6,(index){
      //if(index==0)
      return positionedSebha(top+=7, left+=20);
    });
  }
}
/*
*
*
* ///////////////////////////////////////////////////////////////////////
*  Column(
      children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           sebhaVectorWidget(),
           sebhaVectorWidget(),
           sebhaVectorWidget()
         ],
       ),
        //SizedBox(height: 0,),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:70,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:100,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:130,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:160,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:190,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:210,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            sebhaVectorWidget(),
            SizedBox(width:240,),
            sebhaVectorWidget(),
            Spacer(),
          ],
        )



      ],
    );
* */