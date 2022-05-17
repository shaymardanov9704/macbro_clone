import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:macbro/data/models/category/category_response.dart' as t;
import 'package:macbro/ui/main/home/detail_pages/category_detail_pages/widgets/category_detail_product.dart';

class CategoryDetailList extends StatelessWidget {
  const CategoryDetailList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final t.Children products = ModalRoute.of(context)?.settings.arguments as t.Children;
    return Scaffold(
      appBar: AppBar(
        title: Text(products.name.toString()),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 12, mainAxisSpacing: 6),
        itemBuilder: (BuildContext context, index) {
          final product = products.children?[index] as t.ChildrenChild;
          return CategoryDetailProduct(product: product);
        },
        itemCount: products.children?.length,
      ),
    );
  }
}
