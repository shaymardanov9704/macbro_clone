import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/home/home_controller.dart';
import 'package:macbro/core/theme/app_colors.dart';
import 'package:macbro/ui/main/home/widgets/banner.dart';
import 'package:macbro/ui/main/home/widgets/banner_widget.dart';
import 'package:macbro/ui/main/home/widgets/categories.dart';
import 'package:macbro/ui/main/home/widgets/discounts.dart';
import 'package:macbro/ui/main/home/widgets/featured.dart';
import 'package:macbro/ui/main/home/widgets/new.dart';
import 'package:macbro/ui/main/home/widgets/new_widget.dart';

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
                  borderRadius: BorderRadius.circular(17)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(17))),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell))
        ],
      ),
      body: ListView(
        children: [
          BannerWidget(),
          SizedBox(height: 20,),
         // NewWidget()
        ],
      )
    );
  }
}
