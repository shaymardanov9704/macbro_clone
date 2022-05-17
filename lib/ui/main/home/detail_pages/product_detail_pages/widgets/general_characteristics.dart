import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:macbro/core/theme/app_text_style.dart';
import 'package:macbro/core/theme/app_utils.dart';

class GeneralCharacteristics extends StatelessWidget {
  const GeneralCharacteristics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUtils.kAllPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Общие характеристики',
            style: AppTextStyles.appTS,
          ),
          AppUtils.kBoxHeight12,
          Container(
            width: 343.w,
            padding: AppUtils.kAllPadding8,
            decoration: const BoxDecoration(
                borderRadius: AppUtils.kBorderRadius8, color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('dsd'),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 2,
                      color: Colors.grey,
                    )),
                    const Text('skldkl')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('dsd'),
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 2,
                          color: Colors.grey,
                        )),
                    const Text('skldsadsdadkl')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('dsd'),
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 2,
                          color: Colors.grey,
                        )),
                    const Text('skldkl')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('dsdsadd'),
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 2,
                          color: Colors.grey,
                        )),
                    const Text('skldkl')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
