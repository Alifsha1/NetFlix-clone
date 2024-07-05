import 'package:flutter/material.dart';
import 'package:netflix/assets/assets.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/widget/video_play_widget.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? videoPlayerController;
  bool isVolumeOn = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    videoPlayerController!.initialize();
    videoPlayerController!.play();
    videoPlayerController!.setVolume(5);
    videoPlayerController!.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: SizedBox(
            width: videoPlayerController!.value.size.width,
            height: videoPlayerController!.value.size.height,
            child: VideoPlayer(videoPlayerController!),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                      isVolumeOn == true
                          ? videoPlayerController!.setVolume(0)
                          : videoPlayerController!.setVolume(5);
                      isVolumeOn = !isVolumeOn;
                    },
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                    ),
                  ),
                ),

                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          imageList[widget.index],
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionWidget(icon: Icons.add, title: 'My List'),
                    const VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoPlayWidget(playerController: videoPlayerController!),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kwhitecolor,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
