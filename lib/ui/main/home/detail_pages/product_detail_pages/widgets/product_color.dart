import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:macbro/data/models/product/product_response.dart';

class ProductColor extends GetView<ProductDetailController>{
  ProductColor({Key? key,required this.color,required this.properties}) : super(key: key);
String? color;
final Properties? properties;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: ((controller) {
      return GestureDetector(
        onTap: (){
          controller.getVariant('black', '128gb');
          print(controller.variant.name);
        },
        child: Container(
          width: 165.5.w,
          height: 84.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(width: 1,color: Colors.blue)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red
                  ),
                ),
                const SizedBox(height: 8,),
                Text(color??'')
              ],
            ),
          ),
        ),
      );
    }));
  }
}
