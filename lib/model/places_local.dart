import 'package:hive/hive.dart';

part 'places_local.g.dart';

@HiveType(typeId: 0)
class PlacesLocal extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nombre;
  @HiveField(2)
  String? ciudad;
  @HiveField(3)
  String? departamento;
  @HiveField(4)
  String? descripcion;
  @HiveField(5)
  String? img;
  @HiveField(6)
  String? latitud;
  @HiveField(7)
  String? longitud;
}
