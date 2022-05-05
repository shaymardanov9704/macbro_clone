import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/database/boxes/box.dart';
import '../../../data/database/models/favorite_products.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: ValueListenableBuilder<Box<FavoriteProducts>>(
        valueListenable: Boxes.getProducts().listenable(),
        builder: (context, box, _) {
          final tasks = box.values.toList().cast<FavoriteProducts>();
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){tasks[index].delete();},
              child: Text(tasks[index].id),),
            itemCount: tasks.length,
          );
        },
      ),
    );
  }
}
