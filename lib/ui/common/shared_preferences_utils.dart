import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String mostRecentIndices = "most_recent_sura_indices";
  static const String onBoardingView='onboarding_view';
}
void updateMostRecentSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var savedList = await readMostRecentIndices();
  var newList = [newSuraIndex];
  savedList.remove(newSuraIndex); // to remove old index if exist
  newList.addAll(savedList);
  await prefs.setStringList(
      PrefsKeys.mostRecentIndices,
      newList
          .map(
            (e) => e.toString(),
          )
          .toList());
}

Future<List<int>> readMostRecentIndices() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var indicesList = prefs.getStringList(PrefsKeys.mostRecentIndices);
  var intIndices = indicesList?.map((element) => int.parse(element)).toList();
  return intIndices ?? [];
}
