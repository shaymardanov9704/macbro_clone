import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/ui/main/home/widgets/product.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => ListView.builder(
        itemBuilder: (context, index) {
          var featured = controller.news[index];
          return const ProductItem();
        },
        itemCount: controller.news.length,
      ),
    );
  }
}
