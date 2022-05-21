import 'package:hive/hive.dart';

part 'basket_products.g.dart';

@HiveType(typeId: 1)
class BasketProducts extends HiveObject{
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String imageUrl;

  @HiveField(2)
  late String name;

  @HiveField(3)
  late int price;

}