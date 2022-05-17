import 'package:flutter/material.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/product_capacity.dart';

import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/theme/app_utils.dart';
import '../../../../../../data/models/product/product_response.dart';

class ProductCapacityList extends StatelessWidget {
  const ProductCapacityList({Key? key,required this.list}) : super(key: key);
  final List<Value> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUtils.kAllPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Емкость',style: AppTextStyles.appTS,),
          AppUtils.kBoxHeight12,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                childAspectRatio: 2.3,
                mainAxisSpacing: 12),
            itemBuilder: (BuildContext context,index){
              return ProductCapacity(capacity: list[index].name,);
            },
            itemCount: 3,)
        ],
      ),
    );
  }
}
