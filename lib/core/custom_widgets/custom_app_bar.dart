import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Row(
          children: [
            TextFormField(
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
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),
          ],
        ),
        preferredSize: Size(375.w,200));
  }
}
