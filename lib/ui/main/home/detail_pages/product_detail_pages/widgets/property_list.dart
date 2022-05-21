import 'package:flutter/material.dart';
import 'package:macbro/data/models/product/product_response.dart';
import 'package:macbro/ui/main/home/detail_pages/product_detail_pages/widgets/properties_detail.dart';

class PropertyList extends StatelessWidget {
   PropertyList({Key? key,required this.propertyList}) : super(key: key);

  List<Properties>? propertyList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemCount: propertyList?.length,
        itemBuilder: (context, index) {
          return PropertiesDetail(properties: propertyList![index]);
        });
  }
}
