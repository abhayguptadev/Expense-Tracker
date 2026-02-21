// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransactionModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionModalAdapter extends TypeAdapter<TransactionModal> {
  @override
  final int typeId = 0;

  @override
  TransactionModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModal(
      id: fields[0] as String,
      title: fields[1] as String,
      amount: fields[2] as double,
      isCredit: fields[3] as bool,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.isCredit)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
