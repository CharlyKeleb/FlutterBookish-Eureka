import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeVideoContainer extends StatefulWidget {
  final String videoId;

  const YouTubeVideoContainer({Key? key, required this.videoId})
      : super(key: key);

  @override
  State<YouTubeVideoContainer> createState() => _YouTubeVideoContainerState();
}

class _YouTubeVideoContainerState extends State<YouTubeVideoContainer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    )..onInit = () {
        _controller.cueVideoById(videoId: widget.videoId, startSeconds: 30);
      };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 50.0.h,
          width: 55.0.w,
          child: YoutubePlayer(controller: _controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
