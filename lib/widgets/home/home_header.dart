import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app_assets/app_images.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../../utils/app_colors.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late double width, height;
  List<Widget> headerList = [
     Icon(Icons.add,color: CColors.white,),
     Icon(Icons.search,color: CColors.white,),
    Icon(Icons.notifications,color: CColors.white,),
    Image(image: AssetImage(AppImages.electronics)),
    Image(image: AssetImage(AppImages.appliances))
  ];
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.15,
      width: width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
          itemCount: headerList.length,
          itemBuilder: (BuildContext context, int index) {
        return header(headerList[index]);
      }),
    );
  }

  Widget header(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width * 0.17,
      height: width * 0.17,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: GradientBoxBorder(gradient: CColors.blueGradient, width: 2)),
      child: child,
    );
  }
}
