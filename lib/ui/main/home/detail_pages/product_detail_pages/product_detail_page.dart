import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/characteristics.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/general_characteristics.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_banner.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_capacity_list.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_color_list.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/properties_detail.dart';

import '../../../../../core/theme/app_text_style.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String slug = ModalRoute.of(context)?.settings.arguments as String;
    return GetBuilder<ProductDetailController>(
      initState: (_){
        controller.getProduct(slug);
      },

      builder: (controller) {
        var product = controller.product;
        return Scaffold(
          appBar: AppBar(
            title: Text('${product.name}', style: AppTextStyles.appTS),
          ),
          body: Container(
            child: ListView(
              children: [
                ProductBanner(bannerList: product.gallery,),
                PropertiesDetail(properties: controller.product.properties![0]),
                ProductColorList(),
                Characteristics(),
                GeneralCharacteristics()
              ],
            ),
          ),
        );
      },
    );
  }
}
