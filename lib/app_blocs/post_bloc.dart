import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/app_blocs/post_state.dart';
import 'package:flutter_task/models/post_model.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:http/http.dart';
import 'package:utility_extensions/extensions/context_extensions.dart';

import 'dart:convert';

import '../Utils/functions.dart';

class PostBloc extends Cubit<PostState> {
  PostBloc()
      : super(
          PostState(posts: const []),
        ) {
    getAllPosts();
  }

  getAllPosts() async {
    List<PostModel> posts = [];
    Response response = await Functions.postRequest(
        Uri.parse("${Constants.baseUrl}home-posts-test"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var e in jsonData["posts"]) {
        posts.add(PostModel.fromJson(e));
      }
      emit(state.copyWith(posts: posts));
    }
  }
}
