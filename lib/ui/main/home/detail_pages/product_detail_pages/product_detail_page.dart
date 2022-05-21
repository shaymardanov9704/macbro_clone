import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/bottom_button.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/characteristics.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_banner.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/progres_indicator.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/property_list.dart';

import '../../../../../core/theme/app_text_style.dart';
import '../../../../../data/database/boxes/box.dart';
import '../../../../../data/database/models/favorite_products.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String slug = ModalRoute.of(context)?.settings.arguments as String;
    return GetBuilder<ProductDetailController>(
      initState: (_) {
        controller.getProduct(slug);
      },
      builder: (controller) {
        var product = controller.product;
        return Scaffold(
          appBar: AppBar(
            title: Text(product?.name ?? '', style: AppTextStyles.appTS),
            actions: [
              GetBuilder<HomeController>(builder: (controller) {
                return ValueListenableBuilder<Box<FavoriteProducts>>(
                  valueListenable: Boxes.getProducts().listenable(),
                  builder: (context, box, _) {
                    final products =
                        box.values.toList().cast<FavoriteProducts>();
                    bool k = false;
                    for (var i = 0; i < products.length; i++) {
                      if (product?.id == products[i].id) {
                        k = true;
                      }
                    }
                    return IconButton(
                        onPressed: () {
                          k
                              ? controller.removeProduct(product!.id)
                              : controller.addProduct(
                                  product!.id!,
                                  product.image!,
                                  product.name!,
                                  product.cheapestPrice!);
                        },
                        icon: Icon(
                            k
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: k ? Colors.blue : Colors.grey));
                  },
                );
              })
            ],
          ),
          body: product == null
              ? const CirProIndicator()
              : Stack(
                  children: [
                    ListView(
                      children: [
                        ProductBanner(),
                        PropertyList(
                            propertyList: controller.product!.properties),
                        const Characteristics(),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                    const BottomButton()
                  ],
                ),
        );
      },
    );
  }
}
