import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCapacity extends StatelessWidget {
  const ProductCapacity({Key? key,required this.capacity}) : super(key: key);

  final String? capacity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.5.w,
      height: 76,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white
      ),
      child: Center(
        child: Text(capacity??''),
      ),
    );
  }
}
