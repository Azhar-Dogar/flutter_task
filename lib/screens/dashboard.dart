import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/app_assets/app_icons.dart';
import 'package:flutter_task/app_assets/app_images.dart';
import 'package:flutter_task/app_blocs/post_bloc.dart';
import 'package:flutter_task/app_blocs/post_state.dart';
import 'package:flutter_task/screens/home_screen.dart';
import 'package:flutter_task/utils/app_textstyles.dart';
import 'package:flutter_task/utils/functions.dart';
import 'package:flutter_task/widgets/margin_widget.dart';

import '../utils/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late double width, height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocBuilder<PostBloc, PostState>(
        builder: (BuildContext context, state) => Scaffold(
            bottomNavigationBar: bottomNavigationBar(),
            body: const HomeScreen()),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: BottomNavigationBar(
        backgroundColor: CColors.primary,
        items: [
          BottomNavigationBarItem(
              backgroundColor: CColors.primary,
              icon: Image(
                image: AssetImage(AppIcons.home),
                width: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: CColors.primary,
              icon: Image(
                image: AssetImage(AppIcons.search),
                width: 25,
              ),
              label: "Discover"),
          BottomNavigationBarItem(
              backgroundColor: CColors.primary,
              icon: Container(
                width: width * 0.2,
                height: height * 0.05,
                decoration: BoxDecoration(
                    gradient: CColors.blueGradient,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              label: "Discover"),
          BottomNavigationBarItem(
              backgroundColor: CColors.primary,
              icon: Image(
                image: AssetImage(AppIcons.work),
                width: 25,
              ),
              label: "Deals"),
          BottomNavigationBarItem(
              backgroundColor: CColors.primary,
              icon: Image(
                image: AssetImage(AppIcons.profile),
                width: 25,
              ),
              label: "Profile")
        ],
      ),
    );
  }
}
