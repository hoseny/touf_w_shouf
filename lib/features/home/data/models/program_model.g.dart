// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgramModelAdapter extends TypeAdapter<ProgramModel> {
  @override
  final int typeId = 0;

  @override
  ProgramModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgramModel(
      code: fields[0] as int,
      programName: fields[1] as String,
      programYear: fields[2] as int,
      startPrice: fields[3] as num,
      imgPath: fields[4] as String,
      rateReview: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProgramModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.programName)
      ..writeByte(2)
      ..write(obj.programYear)
      ..writeByte(3)
      ..write(obj.startPrice)
      ..writeByte(4)
      ..write(obj.imgPath)
      ..writeByte(5)
      ..write(obj.rateReview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgramModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
