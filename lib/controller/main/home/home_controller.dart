import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../data/database/boxes/box.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:macbro/data/database/boxes/box.dart';
import 'package:macbro/data/database/models/favorite_products.dart';
import 'package:macbro/data/models/featured_list/featured_list_response.dart'
    as t;

import '../../../base/base_controller.dart';
import '../../../data/models/banners/banners_response.dart';
import '../../../data/models/category/category_response.dart';
import '../../../data/repository/home/home_repository.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;

  HomeController({
    required this.repository,
  });

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<t.Products> _new_products = [];
  int _index = 0;
  static int activeInde = 0;
  static int activeIndexColor = 0;
  final scrollController = ScrollController();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    getBanners();
    getCategories();
    getFeaturedProducts();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    setLoading(false);
  }

  void setIndex(int i) {
    _index = i;
    update();
  }

  Future addProduct(String id, String image, String name, int price) async {
    final productId = FavoriteProducts()
      ..id = id
      ..imageUrl = image
      ..name = name
      ..price = price;

    final box = Boxes.getProducts();
    box.add(productId);
    update();
  }

  Future removeProduct(String? productId) async {
    final items = Boxes.getProducts().values.toList();
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == productId) {
        items[i].delete();
      }
    }
    update();
  }

  void activeIndex(int index) {
    activeInde = index;
    update();
  }

  void activeColor(int index) {
    activeIndexColor = index;
    update();
  }

  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners();
    if (result is BannersResponse) {
      _banners = result.banners!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getCategories() async {
    setLoading(true);
    final result = await repository?.getCategories();
    if (result is CategoryResponse) {
      _categories = result.categories!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getFeaturedProducts() async {
    setLoading(true);
    final result = await repository?.getFeaturedList();
    if (result is t.FeaturedListResponse) {
      _new_products = result.featuredList?.products ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<Banners> get banners => _banners;

  List<Categories> get categories => _categories;

  List<t.Products> get news => _new_products;

  int get index => _index;
}
