import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/post_model.dart';


class PostState extends Equatable {
  List<PostModel> posts;
  PostState({
    required this.posts
  });

  PostState copyWith({
    List<PostModel>? posts,
  }) {
    return PostState(
      posts: posts?? this.posts
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    posts
  ];
}
