import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:macbro/core/theme/app_utils.dart';
import 'package:macbro/data/models/product/product_response.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_color.dart';

import '../../../../../../core/theme/app_text_style.dart';

class ProductColorList extends GetView<ProductDetailController> {
  const ProductColorList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Цвет',style: AppTextStyles.appTS),
          AppUtils.kBoxHeight12,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                childAspectRatio: 2.3,
                mainAxisSpacing: 12),
            itemBuilder: (BuildContext context,index){
              return ProductColor(color: controller.product.properties?[0].value?[index].name.toString(),properties: controller.product.properties?[0],);
            },
            itemCount: controller.product.properties?[0].value?.length,)
        ],
      ),
    );
  }
}
