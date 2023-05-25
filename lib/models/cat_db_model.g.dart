// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatHiveDBModelAdapter extends TypeAdapter<CatHiveDBModel> {
  @override
  final int typeId = 0;

  @override
  CatHiveDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatHiveDBModel(
      catId: fields[0] as String,
      name: fields[1] as String,
      imageId: fields[2] as String,
      lifeSpan: fields[3] as String,
      countryCode: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatHiveDBModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.catId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageId)
      ..writeByte(3)
      ..write(obj.lifeSpan)
      ..writeByte(4)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatHiveDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
