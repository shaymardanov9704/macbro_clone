import 'package:get/get.dart';

import '../controller/main/basket/basket_controller.dart';

class BasketBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BasketController(),fenix: true);

  }
}