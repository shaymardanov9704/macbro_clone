import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macbro/base/base_functions.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/routes/app_routes.dart';


import '../../../../data/database/boxes/box.dart';
import '../../../../data/database/models/favorite_products.dart';
import '../../../../data/models/featured_list/featured_list_response.dart';

class ProductItem extends GetView {
  const ProductItem({Key? key, this.product}) : super(key: key);
  final Products? product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GestureDetector(
        onTap: (){
        Get.toNamed(AppRoutes.product_detail_page,arguments: product?.slug);
        },
        child: Container(
          width: 153.w,
          margin: const EdgeInsets.only(left: 8),
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
                      child: CachedNetworkImage(
                        imageUrl:  product?.image ??
                            'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                        width: 124.w,
                        height: 112.h,
                        errorWidget: (_, __, ___) => SizedBox(
                          child: Image.asset('assets/png/img_3.png'),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ValueListenableBuilder<Box<FavoriteProducts>>(
                          valueListenable: Boxes.getProducts().listenable(),
                          builder: (context, box, _) {
                            final products =
                            box.values.toList().cast<FavoriteProducts>();
                            bool k = false;
                            for (var i = 0; i < products.length; i++) {
                              if (product!.id == products[i].id) {
                                k = true;
                              }
                            }
                            return GestureDetector(
                              onTap: () {
                                k
                                    ? controller.removeProduct(product!.id)
                                    : controller.addProduct(
                                    product!.id!,
                                    product!.image!,
                                    product!.name!,
                                    product!.cheapestPrice!);
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
                                      color: k ? Colors.blue : Colors.grey),
                                ),
                              ),
                            );
                          },
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
                maxLines: 1,
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
      ),
    );
  }
}
