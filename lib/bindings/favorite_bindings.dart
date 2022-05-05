import 'package:get/get.dart';
import 'package:macbro/controller/main/favourite/favorite_controller.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/data/provider/api_client.dart';
import 'package:macbro/data/repository/favorite/favorite_repository.dart';
import 'package:macbro/data/repository/home/home_repository.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController(repository: FavoriteRepository(apiClient: ApiClient.getInstance())),fenix: true);

  }
}