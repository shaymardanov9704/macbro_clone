import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../base/base_functions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/app_utils.dart';
import '../../../data/models/featured_list/featured_list_response.dart';

class SearchItem extends StatelessWidget {
  final Products? product;
  final Function()? onTap;

  const SearchItem({Key? key, this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius12,
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: AppColors.white,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppUtils.kBorderRadius12,
          ),
          leading: Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius8,
              color: AppColors.productBackground,
            ),
            padding: const EdgeInsets.all(8),
            child: CachedNetworkImage(
              imageUrl: product?.image ?? '',
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
              const Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/png/img.png"),
            ),
          ),
          title: Text(
            product?.name ?? "",
            style: AppTextStyles.searchItemTitle,
          ),
          trailing: Text(
            '${BaseFunctions.moneyFormat(double.parse( "0"))} ${'sum'}',
            style: AppTextStyles.searchItemPrice,
          ),
        ),
      ),
    );
  }
}