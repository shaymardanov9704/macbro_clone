import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macbro/data/models/category/category_response.dart';
import 'package:macbro/routes/app_routes.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, this.categories}) : super(key: key);
  final Categories? categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Get.toNamed(AppRoutes.category_detail_page,arguments: categories);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 165.5.w,
        height: 169.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: CachedNetworkImage(
                  imageUrl: categories?.image ??
                      'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                  height: 95,
                  width: 102,
                  errorWidget: (_, __, ___) => SizedBox(

                    child: Image.asset('assets/png/img_3.png'),
                  ),
                )),
            Text(
              categories?.name ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
