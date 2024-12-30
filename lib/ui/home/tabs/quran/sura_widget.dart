import 'package:flutter/material.dart';
import 'package:islami_c13/ui/assets.dart';
import 'package:islami_c13/ui/common/shared_preferences_utils.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';
import 'package:islami_c13/ui/sura_details/sura_details_screen.dart';

class SuraWidget extends StatelessWidget {
  int suraIndex;
  void Function() onTap;
  SuraWidget(this.suraIndex,{super.key,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(AppImages.suraBadge))),
              child: Text(
                '${suraIndex + 1}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Container(
              width: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  QuranResources.englishQuranSurahs[suraIndex],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("${QuranResources.versesNumbers[suraIndex]} verses"),
              ],
            ),
            Spacer(),
            Text(
              QuranResources.arabicQuranSuras[suraIndex],
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
