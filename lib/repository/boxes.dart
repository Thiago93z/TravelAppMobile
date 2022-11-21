import 'package:hive/hive.dart';
import '../model/places_local.dart';

class Boxes {
  static Box<PlacesLocal> boxFavoritos() => Hive.box<PlacesLocal>("favoritos");
}
