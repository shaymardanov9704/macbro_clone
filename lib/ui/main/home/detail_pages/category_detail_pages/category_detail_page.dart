import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macbro/data/models/category/category_response.dart' as t;
import 'package:macbro/ui/main/home/detail_pages/category_detail_pages/widgets/category_detail.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t.Categories? categories = ModalRoute.of(context)?.settings.arguments as t.Categories;
    final List<t.Children>? products = categories?.children ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(categories?.name??''),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 12, mainAxisSpacing: 6),
        itemBuilder: (BuildContext context, index) {
         final product = categories?.children?[index];
          return CategoryDetail(products: product,);
        },
        itemCount: products?.length,
      ),
    );
  }
}