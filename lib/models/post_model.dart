import 'dart:ui';

import 'package:flutter/cupertino.dart';

class PostModel{
  late int postId;
  late int userId;
  late int price;
  late int likes;
  late int comments;
  late int shares;
  late String postVideo;
  late String userName;
  late String profileImage;
  late String postTitle;
  late String country;
  late String hashtag;
  late List<String> images;
  PostModel({
    required this.userName,
    required this.userId,
    required this.country,
    required this.postId,
    required this.postTitle,
    required this.postVideo,
    required this.price,
    required this.hashtag,
    required this.images,
    required this.profileImage
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json["post_id"];
    userId = json["user_id"];
    postVideo = json["post_video"];
    userName = json["name"];
    price = json["price"];
    postTitle = json["post_title"];
    country = json["country"]??"";
    profileImage = json["profile_image"];
    likes = json["likes"];
    hashtag = json["hashtag_titles"];
    List images = json["images"];
    this.images =
        List<String>.generate(images.length, (index) => images[index]["image"])
            .toList();
    images = json["images"];
    comments = json["comments"];
    shares = json["shares"];
  }
}