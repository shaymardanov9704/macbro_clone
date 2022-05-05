import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:macbro/data/models/product/single_product_response.dart' as t;

import '../../../../base/base_functions.dart';
import '../../../../controller/main/home/home_controller.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({Key? key, required this.product}) : super(key: key);

  final t.Product? product;


  @override
  Widget build(BuildContext context) {

    return  GetBuilder<HomeController>(
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
                    product?.image??
                          'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                      width: 124.w,
                      height: 112.h,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.addProduct(product?.id??'');
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(245, 245, 245, 1),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              size: 15,
                              color: Colors.grey,
                            ),
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
              BaseFunctions.moneyFormatSymbol(product?.cheapestPrice ?? 0),
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.blue, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
