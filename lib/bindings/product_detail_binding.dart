import 'package:get/get.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';

import '../controller/main/home/home_controller.dart';
import '../data/provider/api_client.dart';
import '../data/repository/home/home_repository.dart';

  class ProductDetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailController(HomeRepository(apiClient: ApiClient.getInstance())),fenix: true);
  }
}