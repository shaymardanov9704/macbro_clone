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
  Variants? _variants = Variants();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void activeIndex(int index) {
    activeI = index;
    update();
  }

  Future<void> getProduct(String? slugs) async {
    setLoading(true);
    final result = await repository?.getProduct(slugs);
    if (result is ProductResponse) {
      _product = result;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<List<String>?> getVariant(String? color, String cap) async{
    for (var i = 0; i < _product.product!.variants!.length; i++) {
      if (_product.product?.variants?[i].name ==
          '${color?.toLowerCase()}-${cap.toLowerCase()}') {
        _variants = _product.product?.variants?[i];
        return _product.product?.variants?[i].value?.gallery;
      }
    }
    update();
  }

  Product? get product => _product.product;

  Variants? get variant => _variants;
}
