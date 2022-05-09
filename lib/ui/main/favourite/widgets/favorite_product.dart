import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../base/base_functions.dart';
import '../../../../controller/main/home/home_controller.dart';
import '../../../../data/database/models/favorite_products.dart';
import '../../../../data/models/featured_list/featured_list_response.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({Key? key, required this.product}) : super(key: key);

  final FavoriteProducts? product;


  @override
  Widget build(BuildContext context) {

    return  GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: 164.w,
        margin: const EdgeInsets.only(right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 163.w,
              height: 164.h,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl:  product?.imageUrl??
                          'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                      width: 124.w,
                      height: 112.h,
                      errorWidget: (_, __, ___) => SizedBox(
                        child: Image.asset('assets/svg/img_3.png'),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          product?.delete();
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(245, 245, 245, 1),
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              size: 15,
                              color: Colors.blue,
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
              BaseFunctions.moneyFormatSymbol(product?.price ?? 0),
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.blue, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
