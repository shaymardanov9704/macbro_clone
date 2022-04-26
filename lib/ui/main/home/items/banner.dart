import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerI extends StatelessWidget {
  const BannerI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 180.h,
      padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('самые продвинутые смартфоны',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
              const Text(
                'iPhone 12 Pro',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 57.h,
              ),
              Image.asset(
                'assets/svg/img_1.png',
                height: 24.h,
                width: 19.54.w,
              )
            ],
          ),
          Image.asset(
            'assets/svg/img_2.png',
            height: 136.h,
            width: 111.16.w,
          )
        ],
      ),
    );
  }
}
