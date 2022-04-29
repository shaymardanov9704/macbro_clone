import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macbro/ui/main/home/widgets/category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Категории',
          style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:const [
          CategoryItem(),
          CategoryItem(),
        ]),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
            CategoryItem(),
            CategoryItem(),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:const [
            CategoryItem(),
          ],
        ),
      ],
    );
  }
}
