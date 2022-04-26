import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);

  }
}