import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/ui/main/home/widgets/product_widget.dart';

class NewProductsList extends StatelessWidget {
  const NewProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
