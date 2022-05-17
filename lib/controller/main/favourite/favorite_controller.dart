import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:macbro/base/base_controller.dart';

import '../../../data/database/boxes/box.dart';

class FavoriteController extends BaseController with GetSingleTickerProviderStateMixin{

  Future removeProduct(String? productId) async {
    final items = Boxes.getProducts().values.toList();
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == productId) {
        items[i].delete();
      }
    }
    update();
  }
}