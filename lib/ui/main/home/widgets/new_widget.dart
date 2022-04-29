import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/ui/main/home/widgets/new.dart';
import 'package:macbro/ui/main/home/widgets/product_item.dart';



class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) =>
        Container(
          child: ListView.builder(itemBuilder: (context, index) {
            var new_item = controller.news[index];
            return ProductItem(
              new_product: new_item,
            );
          },
          itemCount: controller.news.length,),
        ));
  }
}
