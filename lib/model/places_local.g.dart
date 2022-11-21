// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlacesLocalAdapter extends TypeAdapter<PlacesLocal> {
  @override
  final int typeId = 0;

  @override
  PlacesLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlacesLocal()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..ciudad = fields[2] as String?
      ..departamento = fields[3] as String?
      ..descripcion = fields[4] as String?
      ..img = fields[5] as String?
      ..latitud = fields[6] as String?
      ..longitud = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, PlacesLocal obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.ciudad)
      ..writeByte(3)
      ..write(obj.departamento)
      ..writeByte(4)
      ..write(obj.descripcion)
      ..writeByte(5)
      ..write(obj.img)
      ..writeByte(6)
      ..write(obj.latitud)
      ..writeByte(7)
      ..write(obj.longitud);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
