import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/ui/main/home/widgets/product.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const  EdgeInsets.only(left: 16),
      child: GetBuilder<HomeController>(
        builder: (controller) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var new_item = controller.news[index];
            return ProductItem(
              product: new_item,
            );
          },
          itemCount: controller.news.length,
        ),
      ),
    );
  }
}
