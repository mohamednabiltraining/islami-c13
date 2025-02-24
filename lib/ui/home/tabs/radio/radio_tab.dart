import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'ReciterListPage.dart';
import 'radio/new.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int counter = 0; // Move counter outside build to persist state

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             InkWell(
          onTap: () {
            setState(() {
              print(counter);

              counter = 0; // Set counter to 0 when 'radio' is tapped
           
              print(counter);
            });
          },
          child: Container(
            height: 50,width: 150, padding: EdgeInsets.all(15),
            color: AppColors.primaryGold,
            alignment: Alignment.center,
            child: Text('Radio'),
          ),
        ),
            InkWell(
          onTap: () {
            setState(() {
              print(counter);
              counter = 1; // Set counter to 1 when 'reciter' is tapped
              print(counter);
           
            });
          },
          child: Container(
            height: 50,width: 150, padding: EdgeInsets.all(15),
            color: AppColors.primaryGold,
            alignment: Alignment.center,
            child: Text('Reciter'),
          ),
        ),
       ],),
        
        Expanded(
          child: counter == 1 ? ReciterListPage() : RadioListScreen(),
        ),
//         Expanded(
//   child: counter == 1 
//       ? ReciterListPage() 
//       : Container(color: Colors.blue, child: Center(child: Text('Radio Screen'))),
// ),

      ],
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../../assets.dart';
// import 'ReciterListPage.dart';
// import 'audio_controls.dart';
// import 'radio/new.dart';

// class RadioTab extends StatefulWidget {
//   const RadioTab({super.key});

//   @override
//   State<RadioTab> createState() => _RadioTabState();
// }

// class _RadioTabState extends State<RadioTab> {
//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     // return AudioPlayerWidget(url: 'https://server12.mp3quran.net/maher/001.mp3');
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//                 onTap: () {
//                   counter = 1;
//                   setState(() {});
//                 },
//                 child: Container(
//                   height: 35,
//                   width: 150, padding: EdgeInsets.all(15),
//                   // margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
//                   decoration: BoxDecoration(
//                       // image: DecorationImage(image: AssetImage('assets/images/Mosque-02.png',),opacity: 0.5,alignment: Alignment.bottomCenter),

//                       color: AppColors.primaryGold,
//                       borderRadius: BorderRadius.circular(20)),
//                   // color: Colors.amberAccent,
//                   child: Text('reciter'
//                    , style: TextStyle(color: Colors.black),
//                   ),
//                 )),
//             InkWell(
//                 onTap: () {
//                   counter = 0;
//                   setState(() {});
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(15),
//                   // margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
//                   decoration: BoxDecoration(
//                       // image: DecorationImage(image: AssetImage('assets/images/Mosque-02.png',),opacity: 0.5,alignment: Alignment.bottomCenter),

//                       color: AppColors.primaryGold,
//                       borderRadius: BorderRadius.circular(20)),
//                   height: 35,
//                   width: 150,
//                   // color: Colors.amberAccent,
//                   child: Text(
//                     'radio',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 )),
//           ],
//         ),
//         counter == 1
//             ? Expanded(child: ReciterListPage())
//             : Expanded(child: RadioListScreen()),
//       ],
//     );
//   }
// }
