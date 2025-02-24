import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'reciters/ReciterListPage.dart';
import 'radio/RadioListScreen.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int counter = 0; 

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

              counter = 0; 
           
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
              counter = 1; 
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


      ],
    );
  }
}
