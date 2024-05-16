import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/app_blocs/post_bloc.dart';
import 'package:flutter_task/app_blocs/post_state.dart';
import 'package:flutter_task/models/post_model.dart';
import 'package:flutter_task/widgets/home/home_widget.dart';

import '../widgets/home/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
        builder: (BuildContext context, state) {
      return (state.posts.isEmpty)
          ? const Center(child: Text("No Post yet"))
          : PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: state.posts.length,
              onPageChanged: (v) {},
              itemBuilder: (BuildContext context, int index) {
                return HomeWidget(post: state.posts[index]);
              },
            );
    });
  }
}
