import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/dashboard.dart';
import 'package:flutter_task/utils/app_colors.dart';

import 'app_blocs/post_bloc.dart';

void main() {
  runApp(BlocProvider<PostBloc>(
      create: (_) => PostBloc(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CColors.primary),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}
