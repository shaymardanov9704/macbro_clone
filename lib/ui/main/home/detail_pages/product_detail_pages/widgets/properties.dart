import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:macbro/core/theme/app_colors.dart';
import 'package:macbro/data/models/product/product_response.dart';

import '../../../../../../controller/main/product_detail/product_detail_page_controller.dart';

class PropertiesValue extends StatelessWidget {
   PropertiesValue({Key? key,required this.values,}) : super(key: key);
  final Values values;

  Map map = {
    'black':Colors.black,
    'pink':Colors.pink.shade200,
    'blue':Colors.blue,
    'red':Colors.red,
    'white':Colors.white,
    'gray':Colors.grey,
    'green':Colors.green
  };
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: ((controller) {
      return GestureDetector(
        onTap: (){
          controller.getVariant('pink', '128gb');
          print(controller.variant.name);
        },
        child: Container(
          width: 165.5.w,
          height: 84.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
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
                      borderRadius: BorderRadius.circular(12.w),
                      color: map['${values.value?.toLowerCase()}']
                  ),
                ),
                const SizedBox(height: 8,),
                Text(values.name??"")
              ],
            ),
          ),
        ),
      );
    }));
  }
}
