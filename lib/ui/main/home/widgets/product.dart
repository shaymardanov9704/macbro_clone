import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macbro/base/base_functions.dart';
import 'package:macbro/controller/main/home/home_controller.dart';

import '../../../../data/models/featured_list/featured_list_response.dart';

class ProductItem extends GetView {
  const ProductItem({Key? key, this.product}) : super(key: key);
  final Products? product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: 153.w,
        margin: const EdgeInsets.only(right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 152.w,
              height: 160.h,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      product?.image ??
                          'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                      width: 124.w,
                      height: 112.h,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                         controller.addProduct(product?.id ?? '');
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(245, 245, 245, 1),
                          ),
                          child: Center(
                            child: Icon(CupertinoIcons.heart_fill,
                                size: 15,
                                color: controller.isActive(product?.id ?? '')
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              product?.name ?? '',
              maxLines: 2,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black, fontSize: 17),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              BaseFunctions.moneyFormatSymbol(
                  product?.cheapestPrice ?? 0),
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.blue, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}


/*
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

      Container(
        width: 153.w,
        margin: const EdgeInsets.only(right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 152.w,
              height: 160.h,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      widget.product?.image ??
                          'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                      width: 124.w,
                      height: 112.h,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addProduct(widget.product?.id ?? '');
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(245, 245, 245, 1),
                          ),
                          child: Center(
                            child: Icon(CupertinoIcons.heart_fill,
                                size: 15,
                                color: isFavorite(widget.product?.id ?? '')
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.product?.name ?? '',
              maxLines: 2,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black, fontSize: 17),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              BaseFunctions.moneyFormatSymbol(
                  widget.product?.cheapestPrice ?? 0),
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.blue, fontSize: 17),
            ),
          ],
        ),
      )


      ==


  bool isFavorite(String? id) {
    bool a = true;
    for (var i = 0; i < ids.length; i++) {
      if (id == ids[i].id) {
        a = true;
      } else {
        a = false;
      }
    }
    return a;
  }


      */