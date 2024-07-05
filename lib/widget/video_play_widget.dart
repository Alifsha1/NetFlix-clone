import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayWidget extends StatefulWidget {
  final VideoPlayerController playerController;
  const VideoPlayWidget({
    super.key,
    required this.playerController,
  });

  @override
  State<VideoPlayWidget> createState() => _VideoPlayWidgetState();
}

class _VideoPlayWidgetState extends State<VideoPlayWidget> {
  bool isplaying = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (isplaying) {
                widget.playerController.pause();
              } else {
                widget.playerController.play();
              }
              isplaying = !isplaying;
            });
          },
          icon: isplaying
              ? const Icon(Icons.pause)
              : const Icon(
                  Icons.play_arrow,
                ),
          color: kwhitecolor,
          iconSize: 35,
        ),
        isplaying
            ? const Text(
                'Pause',
                style: TextStyle(color: kwhitecolor, fontSize: 16),
              )
            : const Text(
                'Play',
                style: TextStyle(color: kwhitecolor, fontSize: 16),
              )
      ],
    );
  }
}
