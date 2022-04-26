import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product_item.dart';

class New extends StatelessWidget {
  const New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Новые',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.arrow_right))
          ],
        ),
        SizedBox(
          width: 400,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                ProductItem(),
                ProductItem(),
                ProductItem(),
                ProductItem(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
