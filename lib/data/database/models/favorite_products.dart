import 'package:hive/hive.dart';

part 'favorite_products.g.dart';

@HiveType(typeId: 0)
class FavoriteProducts extends HiveObject{
 @HiveField(0)
 late String id;
}