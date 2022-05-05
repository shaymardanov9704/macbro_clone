import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:macbro/base/base_controller.dart';
import 'package:macbro/data/models/product/single_product_response.dart' as g;
import 'package:macbro/data/repository/favorite/favorite_repository.dart';
import '../../../data/database/boxes/box.dart';
import '../../../data/database/models/favorite_products.dart';

class FavoriteController extends BaseController with GetSingleTickerProviderStateMixin {

  final FavoriteRepository? repository;

  FavoriteController({required this.repository}): assert(repository != null);



  final ids = Boxes.getProducts().values.toList();

  List<g.Product> products = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getP();
    super.onReady();
  }



  // Future<void>getProduct(String id)async{
  //   setLoading(true);
  //   final result = await repository?.getProduct(id);
  //   if (result is g.Product) {
  //
  //   } else {
  //     Get.snackbar('error'.tr, result.toString());
  //   }
  // }

  Future<void>getP()async{
    setLoading(true);
    for(var i =0;i<ids.length;i++){
      final result = await repository?.getProduct(ids[i].id);
      if (result is g.Product) {
       products.add(result);
      } else {
        Get.snackbar('error'.tr, result.toString());
      }
    }
  }

  Future addProduct(String pID) async {
    final productId = FavoriteProducts()..id = pID;
    final box = Boxes.getProducts();
    box.add(productId);
    update();
  }

  //  pr(String id){
  //   final result = repository?.getProduct(id);
  //   if (result is g.Product) {
  //     return result;
  //   } else {
  //     Get.snackbar('error'.tr, result.toString());
  //   }
  // }

  List<g.Product> get favoriteProducts => products;
}