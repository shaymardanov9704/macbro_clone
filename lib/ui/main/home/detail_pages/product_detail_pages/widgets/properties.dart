import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:macbro/core/theme/app_colors.dart';
import 'package:macbro/data/models/product/product_response.dart';

import '../../../../../../controller/main/product_detail/product_detail_page_controller.dart';

class PropertiesValue extends GetView<ProductDetailController> {
   PropertiesValue({Key? key,required this.values,}) : super(key: key);
  final Values values;

  Map map = {
    'black':Colors.black,
    'pink':Colors.pink.shade200,
    'blue':Colors.blue,
    'red':Colors.red,
    'white':Colors.white,
    'grey':Colors.grey,
    'green':Colors.green,
    'silver':Colors.blueGrey.shade400,
    'gold':Colors.yellow.shade400,
    'light blue':Colors.lightBlue,
    'graphite':Colors.black87,
  };
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: ((controller) {
      return GestureDetector(
        onTap: (){
          controller.getVariant(values.value?.toLowerCase(), '128gb');
          if (kDebugMode) {
            print(values.value);
            print(controller.variant?.name?.substring(0,controller.variant?.name?.indexOf('-')));
            print(controller.variant?.name);
          }
        },
        child: Container(
          width: 165.5.w,
          height: 84.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              border: Border.all(width: 1.5,color: values.value?.toLowerCase()==controller.variant?.name?.toLowerCase().substring(0,controller.variant?.name?.indexOf('-'))?Colors.blue:Colors.transparent)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: map.containsKey(values.value?.toLowerCase()),
                  //values.value?.toLowerCase().substring(values.value?.length-2)!='gb'
                  child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(width: 0.5,color: Colors.grey),
                      color: map['${values.value?.toLowerCase()}']
                  ),
                ),),
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
