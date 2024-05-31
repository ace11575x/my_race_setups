import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part '../g.dart/track.g.dart';

@HiveType(typeId: 0)
class Track{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String size;
  @HiveField(2)
  late String composition;

  Track(this.name, this.size, this.composition);

  static void addTrackToBox(String name, String size, String comp) async {
    final box = Hive.box<Track>('tracks');
    final newTrack = Track(name, size, comp);
  box.add(newTrack);
  } 
}