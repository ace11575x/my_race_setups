import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:my_race_setups/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_race_setups/models/track.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TrackAdapter());
  await Hive.openBox<Track>('tracks'); //Create a hive box to store tracks
  runApp(MainApp());
}

class MyAppState extends ChangeNotifier{
  var current = WordPair.random();

  void getNext(){
    current = WordPair.random();
    notifyListeners();
  }
  var favorites = <WordPair>[];
  void toggleFavorite(){
    if(favorites.contains(current)){
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
