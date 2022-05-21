import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:macbro/base/base_controller.dart';
import 'package:macbro/data/database/models/basket_products.dart';

import '../../../data/database/boxes/box.dart';

class BasketController extends BaseController with GetSingleTickerProviderStateMixin{

  Future removeProduct(String? productId) async {
    final items = Boxes.getProductsForBasket().values.toList();
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == productId) {
        items[i].delete();
      }
    }
    update();
  }

  Future addProduct(String id, String image, String name, int price) async {
    final productId = BasketProducts()
      ..id = id
      ..imageUrl = image
      ..name = name
      ..price = price;

    final box = Boxes.getProductsForBasket();
    box.add(productId);
    update();
  }

}