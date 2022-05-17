import 'package:get/get.dart';
import 'package:macbro/bindings/category_detail_binding.dart';
import 'package:macbro/bindings/category_detail_list_binding.dart';
import 'package:macbro/bindings/main_bindings.dart';
import 'package:macbro/bindings/splash_bindings.dart';
import 'package:macbro/routes/app_routes.dart';
import 'package:macbro/ui/main/home/detail_pages/category_detail_pages/category_detail_list_page.dart';
import 'package:macbro/ui/main/home/detail_pages/category_detail_pages/category_detail_page.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/product_detail_page.dart';
import 'package:macbro/ui/main/main/main_page.dart';
import 'package:macbro/ui/splash/splash_page.dart';

import '../bindings/product_detail_binding.dart';

class AppPages{
  static final pages = [
   GetPage(name: AppRoutes.initial, page:()=>const SplashPage(),binding: SplashBindings()),
   GetPage(name: AppRoutes.main, page:()=> const MainPage(),binding: MainBindings()),
    GetPage(name: AppRoutes.category_detail_page, page: ()=>const CategoryDetailPage(),binding: CategoryDetailBindings() ),
    GetPage(name: AppRoutes.category_detail_page_list, page: ()=>const CategoryDetailList(),binding: CategoryDetailListBindings()),
    GetPage(name: AppRoutes.product_detail_page, page: ()=>const ProductDetailPage(),binding: ProductDetailBindings()),
  ];
}