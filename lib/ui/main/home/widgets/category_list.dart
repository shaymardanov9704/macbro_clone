import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/ui/main/home/widgets/category_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 12,
            mainAxisSpacing: 6),
        itemCount: controller.categories.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          var category = controller.categories[index];
          return CategoryWidget(categories: category);
        },
      ),
    );
  }
}
