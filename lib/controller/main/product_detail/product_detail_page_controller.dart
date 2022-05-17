import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:macbro/base/base_controller.dart';

import '../../../data/models/product/product_response.dart';
import '../../../data/repository/home/home_repository.dart';

class ProductDetailController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;

  ProductDetailController(this.repository);

  static int activeI = 0;
  ProductResponse _product = ProductResponse();
  String slug = 'dji-om5-juqgil2bn5me5';
  List? gallery = [];
  Variants? variants = Variants();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getProduct(slug);
    super.onReady();
  }

  void activeIndex(int index) {
    activeI = index;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    setLoading(false);
  }

  Future<void> getProduct(String? slugs) async {
    setLoading(true);
    final result = await repository?.getProduct(slugs);
    if (result is ProductResponse) {
      _product = result as ProductResponse;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  getVariant(String color, String cap) {
    for (var i = 0; i < _product.product!.variants!.length; i++) {
      if (_product.product?.variants?[i].name ==
          '${color.toLowerCase()}-$cap') {
        variants = _product.product?.variants?[i];
      }
    }
  }

  Product get product => _product.product ?? Product();

  Variants get variant => variants ?? Variants();
}
