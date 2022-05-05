import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../data/database/boxes/box.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:macbro/data/database/boxes/box.dart';
import 'package:macbro/data/database/models/favorite_products.dart';
import 'package:macbro/data/models/featured_list/featured_list_response.dart'
    as t;
import 'package:macbro/data/models/product/single_product_response.dart' as g;

import '../../../base/base_controller.dart';
import '../../../data/models/banners/banners_response.dart';
import '../../../data/models/category/category_response.dart';
import '../../../data/repository/home/home_repository.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;

  HomeController({
    required this.repository,
    }) ;

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<t.Products> _new_products = [];
  g.Product productResponse = g.Product();
  int _index = 0;
  static int activeInde = 0;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getBanners();
    getCategories();
    getFeaturedProducts();
    super.onReady();
  }

  void setIndex(int i) {
    _index = i;
    update();
  }

  final ids = Boxes.getProducts().values.toList();

  bool isActive(String id){
    bool a = false;
    for (var i = 0; i < ids.length; i++) {
      if (id == ids[i].id) {
        a = true;
      } else {
        a = false;
      }
    }
    return a;
  }
  Future addProduct(String pID) async {
    final productId = FavoriteProducts()..id = pID;

    final box = Boxes.getProducts();
    box.add(productId);
    update();
  }


//   Future removeProduct(String productId)async{
//
// }
  void activeIndex(int index) {
    activeInde = index;
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

 g.Product get product => productResponse;

  int get index => _index;
}
