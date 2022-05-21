import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:macbro/controller/main/basket/basket_controller.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:macbro/data/database/models/basket_products.dart';

import '../../../../../../base/base_functions.dart';
import '../../../../../../core/theme/app_utils.dart';
import '../../../../../../data/database/boxes/box.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                BasketController().addProduct(
                    controller.product?.id ?? '',
                    controller.product?.image ?? '',
                    controller.product?.name ?? '',
                    controller.product?.variants?[0].value?.price?.uzsPrice ??
                        0);
              },
              child: ValueListenableBuilder<Box<BasketProducts>>(
                valueListenable: Boxes.getProductsForBasket().listenable(),
                builder: (context, box, _) {
                  final products = box.values.toList().cast<BasketProducts>();
                  bool k = false;
                  for (var i = 0; i < products.length; i++) {
                    if (controller.product?.id == products[i].id) {
                      k = true;
                    }
                  }
                  return k
                      ? Container(
                          width: 375.w,
                          height: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(187, 187, 187, 0.35),
                                spreadRadius: 4,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Container(
                              width: 343.w,
                              height: 48,
                              padding: AppUtils.kAllPadding8,
                              decoration: const BoxDecoration(
                                  borderRadius: AppUtils.kBorderRadius8,
                                  color: Colors.green),
                              child: const Center(
                                child: Text(
                                  'Добавлено',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 375.w,
                          height: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(187, 187, 187, 0.35),
                                spreadRadius: 4,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: GestureDetector(
                              child: Container(
                                width: 343.w,
                                height: 48,
                                padding: AppUtils.kAllPadding8,
                                decoration: const BoxDecoration(
                                    borderRadius: AppUtils.kBorderRadius8,
                                    color: Colors.blue),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Text(
                                      'В корзину',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      BaseFunctions.moneyFormatSymbol(controller
                                              .variant
                                              ?.value
                                              ?.price
                                              ?.uzsPrice ??
                                          controller.product?.variants?[0].value
                                              ?.price?.uzsPrice ??
                                          0),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                },
              ))
        ],
      );
    });
  }
}
/*
Container(
              width: 375.w,
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(187, 187, 187, 0.35),
                    spreadRadius: 4,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    width: 343.w,
                    height: 48,
                    padding: AppUtils.kAllPadding8,
                    decoration: const BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius8,
                        color: Colors.blue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'В корзину',
                          style: TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          BaseFunctions.moneyFormatSymbol(
                              controller
                              .variant?.value?.price?.uzsPrice ??
                              controller.product?.variants?[0].value?.price?.uzsPrice??0),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
 */
