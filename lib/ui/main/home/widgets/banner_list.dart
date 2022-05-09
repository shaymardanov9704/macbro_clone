import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:macbro/ui/main/home/widgets/banner_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../controller/main/home/home_controller.dart';

class BannerList extends StatefulWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  State<BannerList> createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.banners.isNotEmpty,
        child: Stack(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 180.h,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) => controller.activeIndex(index),
              ),
              itemCount: controller.banners.length,
              itemBuilder: (context, index, realIndex) {
                var banner = controller.banners[index];
                return BannerWidget(
                  banner: banner,
                );
              },
            ),
            Container(
              width: 343.w,
              height: 180.h,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: HomeController.activeInde,
                    count: controller.banners.length,
                    effect: const ScrollingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black87,
                        dotHeight: 6,
                        dotWidth: 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
