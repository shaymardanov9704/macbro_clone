import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macbro/base/base_functions.dart';
import 'package:macbro/core/theme/app_utils.dart';
import 'package:macbro/data/database/models/basket_products.dart';

import '../../../../controller/main/basket/basket_controller.dart';

class BasketProduct extends StatelessWidget {
  BasketProduct({Key? key, required this.product}) : super(key: key);

  BasketProducts product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: 343,
      height: 137,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            height: 105,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: SizedBox(
              width: 186,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    BaseFunctions.moneyFormatSymbol(product.price),
                    style: const TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                  AppUtils.kBoxHeight12,
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey.shade300),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text('1'),
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey.shade300),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.add,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              BasketController().removeProduct(product.id);
            },
            icon: const Icon(
              CupertinoIcons.delete,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
