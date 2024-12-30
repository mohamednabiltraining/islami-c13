import 'package:flutter/material.dart';
import 'package:islami_c13/ui/common/shared_preferences_utils.dart';
import 'package:islami_c13/ui/home/tabs/quran/most_recent_card.dart';
import 'package:islami_c13/ui/home/tabs/quran/resources.dart';
import 'package:islami_c13/ui/home/tabs/quran/sura_widget.dart';

import '../../../sura_details/sura_details_screen.dart';
class QuranTab extends StatefulWidget {
  QuranTab({super.key});
  @override
  State<QuranTab> createState() => _QuranTabState();
}
class _QuranTabState extends State<QuranTab> {
  List<int> mostRecentList = [];
  List<int> filteredSuraIndices = List.generate(
    114,
        (index) {
      return index;
    },
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getSavedMostRecentData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (newText) {
              filterSuraListByText(newText);
            },
            decoration: InputDecoration(
                hintText: "Search by name",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))),
          ),
        ),
        Visibility(
          visible: mostRecentList.isNotEmpty,
          child: Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MostRecentCard(mostRecentList[index]);
              },
              itemCount: mostRecentList.length,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: filteredSuraIndices.length,
            itemBuilder: (context, index) {
              return SuraWidget(filteredSuraIndices[index],
                  onTap: () {
                    updateMostRecentSuraList(filteredSuraIndices[index]);
                    getSavedMostRecentData();
                    Navigator.of(context)
                        .pushNamed(SuraDetailsScreen.routeName, arguments:filteredSuraIndices[index]);
                  }
              );
            },
            separatorBuilder: (context, index) => Container(
              color: Colors.white,
              height: 1,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 64),
            ),
          ),
        )
      ],
    );
  }
  void getSavedMostRecentData() async {
    var indicesList = await readMostRecentIndices();
    var isDifferent = false;
    if (indicesList.length != mostRecentList.length) {
      isDifferent = true;
    } else if (indicesList.isNotEmpty &&
        (indicesList.firstOrNull != mostRecentList.firstOrNull)) {
      isDifferent = true;
    }

    if (!isDifferent) {
      return;
    }
    print("updating most recent");
    setState(() {
      this.mostRecentList = indicesList;
    });
  }

  void filterSuraListByText(String newText) {
    var searchQuery = newText.toLowerCase();
    List<int> filteredList = [];
    for (int i = 0; i < QuranResources.englishQuranSurahs.length; i++) {
      if (QuranResources.englishQuranSurahs[i]
          .toLowerCase()
          .contains(searchQuery)) {
        filteredList.add(i);
      } else if (QuranResources.arabicQuranSuras[i]
          .toLowerCase()
          .contains(searchQuery)) {
        filteredList.add(i);
      }
    }
    setState(() {
      filteredSuraIndices = filteredList;
    });
  }
}
