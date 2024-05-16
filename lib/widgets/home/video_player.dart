import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false;
  bool initialized = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    initializedController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setPlayIconVisibility();
      },
      child: Stack(
        children: [
          Center(
            child: !initialized
                ? const CircularProgressIndicator() // Display loading indicator while buffering
                : AspectRatio(
                    aspectRatio: 11 / 21, child: VideoPlayer(_controller)),
          ),
          if (isVisible) playIcon()
        ],
      ),
    );
  }

  Widget playIcon() {
    return Center(
      child: InkWell(
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
            isPlaying = false;
          } else {
            _controller.play();
            isPlaying = true;
          }
          setPlayIconVisibility();
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              (isPlaying) ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  setPlayIconVisibility() async {
    setState(() {
      isVisible = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isVisible = false;
    });
  }

  void initializedController() {
    _controller.addListener(() {
      if (_controller.value.isInitialized && !_controller.value.isPlaying) {
        setState(() {
          initialized = true;
        });
      }
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) {
      _controller.play();
      isPlaying = true;
    });
    setPlayIconVisibility();
  }
}
