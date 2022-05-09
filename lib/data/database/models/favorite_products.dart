import 'package:hive/hive.dart';

part 'favorite_products.g.dart';

@HiveType(typeId: 0)
class FavoriteProducts extends HiveObject{
 @HiveField(0)
 late String id;

 @HiveField(1)
 late String imageUrl;

 @HiveField(2)
 late String name;

 @HiveField(3)
 late int price;

}