// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memoriality_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemorialityModelAdapter extends TypeAdapter<MemorialityModel> {
  @override
  final int typeId = 3;

  @override
  MemorialityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemorialityModel(
      fitnosGotovDate: fields[0] as DateTime,
      fitnosModel: fields[1] as FitnosModel,
    );
  }

  @override
  void write(BinaryWriter writer, MemorialityModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fitnosGotovDate)
      ..writeByte(1)
      ..write(obj.fitnosModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemorialityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
