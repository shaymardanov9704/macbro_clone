// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteProductsAdapter extends TypeAdapter<FavoriteProducts> {
  @override
  final int typeId = 0;

  @override
  FavoriteProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteProducts()
      ..id = fields[0] as String
      ..imageUrl = fields[1] as String
      ..name = fields[2] as String
      ..price = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, FavoriteProducts obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
