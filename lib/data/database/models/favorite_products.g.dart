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
    return FavoriteProducts()..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, FavoriteProducts obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
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
