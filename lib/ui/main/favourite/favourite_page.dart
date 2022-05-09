import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macbro/data/database/models/favorite_products.dart';
import 'package:macbro/ui/main/favourite/widgets/favorite_product.dart';

import '../../../data/database/boxes/box.dart';

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
      body: ValueListenableBuilder<Box<FavoriteProducts>>(
        valueListenable: Boxes.getProducts().listenable(),
        builder: (context, box, _) {
          final products = box.values.toList().cast<FavoriteProducts>();
          return Container(
            child: products.isNotEmpty ?GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 0),
              itemBuilder: (context, index) =>
                  FavoriteProduct(product: products[index]),
              itemCount: products.length,
            ):SizedBox(
              child: Center(
                child: Image.asset('assets/png/empty.png',width: 311,height: 311,),
              ),
            ),
          );
        },
      ),
    );
  }
}


