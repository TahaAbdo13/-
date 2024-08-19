// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinancemodelAdapter extends TypeAdapter<Financemodel> {
  @override
  final int typeId = 0;

  @override
  Financemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Financemodel(
      detailes: fields[0] as String,
      value: fields[1] as double,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Financemodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.detailes)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinancemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
