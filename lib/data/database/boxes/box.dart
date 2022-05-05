import 'package:hive/hive.dart';
import 'package:macbro/data/database/models/favorite_products.dart';


class Boxes {
  static Box<FavoriteProducts> getProducts() =>
      Hive.box<FavoriteProducts>('favorite');
}