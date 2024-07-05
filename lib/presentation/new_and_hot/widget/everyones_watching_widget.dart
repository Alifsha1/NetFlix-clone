
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/custom_button.dart';
import 'package:netflix/presentation/widgets/video_widgets.dart';

class EveryOneWatchingWidget extends StatefulWidget {
   final String movieName;
  final String movieDescription;
  final String poster;
  const EveryOneWatchingWidget({
    super.key,
      required this.movieName,
    required this.movieDescription,
    required this.poster,
  });

  @override
  State<EveryOneWatchingWidget> createState() => _EveryOneWatchingWidgetState();
}

class _EveryOneWatchingWidgetState extends State<EveryOneWatchingWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
         Text(
          widget.movieName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
         Text(
          widget.movieDescription,
          style: const TextStyle(color: kgreycolor),
        ),
        kheight50,
        VideoWidet(poster: widget.poster,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.telegram,
              title: "Share",
              iconsize: 26,
              textSize: 18,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconsize: 26,
              textSize: 18,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconsize: 26,
              textSize: 18,
            ),
            kwidth
          ],
        )
      ],
    );
  }
}