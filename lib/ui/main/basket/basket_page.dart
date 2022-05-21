import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macbro/data/database/models/basket_products.dart';
import 'package:macbro/ui/main/basket/widgets/product.dart';

import '../../../data/database/boxes/box.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      body: ValueListenableBuilder<Box<BasketProducts>>(
        valueListenable: Boxes.getProductsForBasket().listenable(),
        builder: (context, box, _) {
          final products = box.values.toList().cast<BasketProducts>();
          return products.isNotEmpty?Container(
            margin: const EdgeInsets.all(16),
            height: products.length*137,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => BasketProduct(product: products[index],),
              itemCount: products.length,
            ),
          ):SizedBox(
            child: Center(
              child: Image.asset('assets/png/empty.png',width: 311,height: 311,),
            ),
          );
        },
      ),
    );
  }
}
