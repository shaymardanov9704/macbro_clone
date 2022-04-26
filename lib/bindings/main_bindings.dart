import 'package:get/get.dart';
import 'package:macbro/controller/main/main_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MainController(),fenix: true);

  }

}