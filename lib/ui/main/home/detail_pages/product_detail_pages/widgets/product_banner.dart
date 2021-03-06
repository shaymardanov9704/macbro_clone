import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macbro/controller/main/product_detail/product_detail_page_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ProductBanner extends GetView<ProductDetailController> {
  int active = 0;
  List list = [
    'assets/png/img.png',
    'assets/png/img_1.png',
    'assets/png/img_2.png'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: ((controller) {
        return Visibility(
            visible: controller.variant != null,
            child: Container(
          height: 250,
          color: Colors.white,
          child: Stack(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: 180.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) =>
                        controller.activeIndex(index)),
                itemCount: controller.variant?.value?.gallery?.length??controller.product?.variants?[1].value?.gallery?.length,
                itemBuilder: (context, index, realIndex) {
                  var banner = controller.variant?.value?.gallery?[index]??controller.product?.variants?[1].value?.gallery?[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: CachedNetworkImage(
                      imageUrl: banner??'',
                      width: 194,
                      height: 229,
                    ),
                  );
                },
              ),
              Container(
                width: 375.w,
                height: 250.h,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: ProductDetailController.activeI,
                      count: 3,
                      effect: const ScrollingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Colors.black87,
                          dotHeight: 6,
                          dotWidth: 6),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
      }),
    );
  }
}
//visible: controller.product!.gallery!.isNotEmpty,