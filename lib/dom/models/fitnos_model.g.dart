// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitnos_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FitnosModelAdapter extends TypeAdapter<FitnosModel> {
  @override
  final int typeId = 1;

  @override
  FitnosModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FitnosModel(
      fitnosKey: fields[4] as String,
      fitnosImage: fields[0] as String,
      fitnosCal: fields[1] as String,
      fitnosName: fields[2] as String,
      fitnosExList: (fields[3] as List).cast<FitnosExModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, FitnosModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fitnosImage)
      ..writeByte(1)
      ..write(obj.fitnosCal)
      ..writeByte(2)
      ..write(obj.fitnosName)
      ..writeByte(3)
      ..write(obj.fitnosExList)
      ..writeByte(4)
      ..write(obj.fitnosKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FitnosModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FitnosExModelAdapter extends TypeAdapter<FitnosExModel> {
  @override
  final int typeId = 2;

  @override
  FitnosExModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FitnosExModel(
      fitnoExsImage: fields[0] as String,
      fitnosExName: fields[1] as String,
      fitnosExDesc: fields[2] as String,
      fitnosExSec: fields[3] as int,
      fitnosExTag: fields[4] as String,
      fitnosExComplete: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FitnosExModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fitnoExsImage)
      ..writeByte(1)
      ..write(obj.fitnosExName)
      ..writeByte(2)
      ..write(obj.fitnosExDesc)
      ..writeByte(3)
      ..write(obj.fitnosExSec)
      ..writeByte(4)
      ..write(obj.fitnosExTag)
      ..writeByte(5)
      ..write(obj.fitnosExComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FitnosExModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
