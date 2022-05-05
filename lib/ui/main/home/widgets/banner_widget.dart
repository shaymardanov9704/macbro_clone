import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:macbro/ui/main/home/widgets/banner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../controller/main/home/home_controller.dart';

class BannerWidget extends StatefulWidget {
   BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final controller1 = PageController(viewportFraction: 0.8, keepPage: true);

 int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 180.h,
                      autoPlay: false,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 2),
                      onPageChanged: (index,reason)=>
                          controller.activeIndex(index)
                  ),
                  itemCount: controller.banners.length,
                  itemBuilder: (context, index, realIndex) {
                    var banner = controller.banners[index];
                    return BannerItem(
                      banner: banner,
                    );
                  },
                ),
                Container(
                  width: 343.w,
                  height: 180.h,
                  padding:const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: HomeController.activeInde,
                        count:  controller.banners.length,
                        effect:const ScrollingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.black87,
                            dotHeight: 6,
                            dotWidth: 6
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ],
        )
      ),
    );
  }
}
/*
AnimatedSmoothIndicator(
                  activeIndex: HomeController.activeInde,
                  count:  controller.banners.length,
                  effect:const ScrollingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black87,
                    dotHeight: 10,
                    dotWidth: 10
                  ),
                )
 */