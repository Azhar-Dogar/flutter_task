import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/home/home_header.dart';
import 'package:flutter_task/widgets/home/video_player.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../app_assets/app_icons.dart';
import '../../app_assets/app_images.dart';
import '../../models/post_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_textstyles.dart';
import '../margin_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key, required this.post});

  final PostModel post;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late double width, height;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    List<String> images = widget.post.images;
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            String path = widget.post.profileImage.replaceAll("\\", "");
            String imagePath = path.split("profile").first;
            return (index == 0)
                ? VideoPlayerWidget(
                    videoUrl: widget.post.postVideo.replaceAll('\\', ''))
                : Image(
                    image: NetworkImage("${imagePath}posts/${images[index]}"),
                    width: width,
                    height: height,
                    fit: BoxFit.fill,
                  );
          },
        ),
        const Positioned(left: 20, child: HomeHeader()),
        Positioned(
          left: 25,
          right: 15,
          bottom: 40,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [itemInfo(), socialIcons()],
            ),
          ),
        ),
      ],
    );
  }

  Widget itemInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.post.postTitle,
          style: AppTextStyles.urbanist(
              color: CColors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          "${widget.post.price}",
          style: AppTextStyles.urbanist(
              fontWeight: FontWeight.w700, fontSize: 24, color: CColors.yellow),
        ),
        Text(
          widget.post.hashtag,
          style: AppTextStyles.urbanist(
              fontSize: 13, fontWeight: FontWeight.w600, color: CColors.white),
        ),
        const MarginWidget(
          factor: 0.5,
        ),
        Row(
          children: [
            Image(
              image: AssetImage(AppIcons.flag),
              width: 30,
            ),
            const MarginWidget(
              isHorizontal: true,
            ),
            Text(
              widget.post.country,
              style: AppTextStyles.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: CColors.white),
            )
          ],
        ),
        const MarginWidget(),
        Container(
          width: width * 0.4,
          height: height * 0.06,
          decoration: BoxDecoration(
              gradient: CColors.blueGradient,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Visit Website",
                style: AppTextStyles.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: CColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget socialIcons() {
    print(widget.post.profileImage.replaceAll('\\', ''));
    print("profile image");
    return Column(
      children: [
        icon(AppIcons.offer, text: "Offer"),
        const MarginWidget(),
        icon(AppIcons.like, text: "${widget.post.likes}"),
        const MarginWidget(),
        icon(AppIcons.chat, text: "${widget.post.comments}"),
        const MarginWidget(),
        icon(AppIcons.share, text: "${widget.post.shares}"),
        const MarginWidget(),
        if (widget.post.profileImage != "") ...[
          CircleAvatar(
            backgroundImage:
                NetworkImage(widget.post.profileImage.replaceAll('\\', '')),
            radius: 20,
          )
        ] else ...[
          Image(
            image: AssetImage(AppIcons.profileIcon),
            width: 40,
          ),
        ],
      ],
    );
  }

  Widget icon(String image, {String? text}) {
    return Column(
      children: [
        Image(
          image: AssetImage(image),
          width: 40,
        ),
        if (text != null) ...[
          const MarginWidget(
            factor: 0.2,
          ),
          Text(
            text,
            style: AppTextStyles.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CColors.white),
          )
        ]
      ],
    );
  }
}
