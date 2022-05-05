import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/core/theme/app_colors.dart';
import 'package:macbro/ui/main/home/widgets/banner_widget.dart';
import 'package:macbro/ui/main/home/widgets/category_widget.dart';
import 'package:macbro/ui/main/home/widgets/featured_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.1,
          title: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.search),
              hintText: 'Поиск',
              fillColor: const Color.fromRGBO(249, 249, 253, 1),
              filled: true,
              border: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(17),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell),
            )
          ],
        ),
        body: ListView(
          children: [
            BannerWidget(),
            SizedBox(height: 39.h),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Новые',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon:const Icon(CupertinoIcons.arrow_right))
                ],
              ),
            ),
            const FeaturedWidget(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Категории',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon:const Icon(CupertinoIcons.arrow_right))
                ],
              ),
            ),
           const CategoriesWidget(),
          ],
        ),);
  }
}
