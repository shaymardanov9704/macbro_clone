import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:macbro/core/theme/app_text_style.dart';
import 'package:macbro/core/theme/app_utils.dart';

class Characteristics extends StatelessWidget {
  const Characteristics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUtils.kAllPadding16,
      width: 343.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Характеристики',style: AppTextStyles.appTS),
          AppUtils.kBoxHeight12,
          Container(
            width: 343.w,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: Colors.white
            ),
          ),
          AppUtils.kBoxHeight12,
          GestureDetector(
            child: Container(
              width: 165.5.w,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  color: Colors.grey.shade200
              ),
              child: Center(
                child: Text('Подробнее ...'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
