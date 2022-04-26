import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            width: 165.w,
            height: 166.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  'assets/svg/img.png',
                  height: 95,
                  width: 102,
                )),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Apple',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                )
              ],
            )),
      ],
    );
  }
}
