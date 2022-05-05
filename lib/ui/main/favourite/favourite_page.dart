import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macbro/controller/main/favourite/favorite_controller.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/data/database/models/favorite_products.dart';
import 'package:macbro/ui/main/favourite/widgets/favorite_product.dart';

import '../../../data/database/boxes/box.dart';
import '../home/widgets/product.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    super.initState();
    Hive.openBox<FavoriteProducts>('favorite');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: GetBuilder<FavoriteController>(
        builder: (controller) => GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 12,
              mainAxisSpacing: 6),
          itemCount: controller.favoriteProducts.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var product = controller.favoriteProducts[index];
            return FavoriteProduct(
              product: product,
            );
          },

        ),
      ),
    );
  }
}

/*

itemBuilder: (context, index) {
            var product = controller.favoriteProducts[index];
            return FavoriteProduct(
              product: product,
            );
          },
          itemCount: controller.favoriteProducts.length,

ValueListenableBuilder<Box<FavoriteProducts>>(
            valueListenable: Boxes.getProducts().listenable(),
            builder: (context, box, _) {
              final tasks = box.values.toList().cast<FavoriteProducts>();
              return ListView.builder(
                itemBuilder: (context, index) => Text(tasks[index].id),
                itemCount: tasks.length,
              );
            },
          )
 */
