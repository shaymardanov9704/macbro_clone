
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:macbro/data/models/new/new_response.dart';

import '../../../base/base_controller.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/banners/banners_response.dart';
import '../../../data/models/category/category_response.dart';
import '../../../data/repository/home/home_repository.dart';
import '../../../ui/main/home/widgets/new.dart';


class HomeController extends BaseController

  with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;

  HomeController({
  required this.repository,
  }) : assert(repository != null);

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<News> _new_products = [];
  int _index = 0;
  late TabController tabController;
  final scrollController = ScrollController();

  @override
  void onInit() {
  getBanners();
  tabController = TabController(length: 1, vsync: this);
  super.onInit();
  }

  void setIndex(int i) {
  _index = i;
  update();
  }

  Future<void> getBanners() async {
  setLoading(true);
  final result = await repository?.getBanners(shipperId: AppConstants.shipperId);
  if (result is BannersResponse) {
  _banners = result.banners!;
  update();
  print('ture');
  } else {
  Get.snackbar('error'.tr, result.toString());
  }
  }


  Future<void> getCategories() async {
    setLoading(true);
    final result = await repository?.getCategoryWithProducts(shipperId: AppConstants.shipperId);
    if (result is CategoryResponse) {
      _categories = result.categories!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getNewProducts() async {
    setLoading(true);
    final result = await repository?.getNewProducts(shipperId: AppConstants.shipperId);
    if (result is NewResponse) {
      _new_products = result.news!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<Banners> get banners => _banners;

  List<Categories> get categories => _categories;

  List<News> get news => _new_products;

  int get index => _index;

  // List<Categories> get checkedCategories =>
  // _categories.where((element) => element.isChecked).toList();


  }

