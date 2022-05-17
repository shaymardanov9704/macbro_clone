import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:macbro/data/models/product/product_response.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_color.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/properties.dart';

class PropertiesDetail extends StatelessWidget {
  const PropertiesDetail({Key? key,required this.properties}) : super(key: key);

  final Properties properties;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (controller){
      return Column(
       children: [
          Text(properties.property?.name??''),
         GridView.builder(
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
               crossAxisSpacing: 12,
               childAspectRatio: 2.3,
               mainAxisSpacing: 12),
           itemBuilder: (BuildContext context,index){
             return PropertiesValue(values: properties.value![index]);
           },
           itemCount: properties.value?.length,)
       ],
      );
    });
  }
}
