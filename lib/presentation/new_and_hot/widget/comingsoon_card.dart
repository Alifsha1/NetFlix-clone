import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/custom_button.dart';
import 'package:netflix/presentation/widgets/video_widgets.dart';

class ComingSoonWidget extends StatelessWidget {
  final String movieName;
  final String movieDescription;
  final String moviePoster;
  final DateTime date;
  const ComingSoonWidget({
    super.key,
    required this.movieName,
    required this.movieDescription,
    required this.moviePoster,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.15,
          height: size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(DateFormat('MMM').format(date).toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kgreycolor)),
              Text(
                DateFormat('dd').format(date),
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - size.width * 0.15,
          height: size.height * 0.68,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidet(poster: moviePoster),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      style: GoogleFonts.shadowsIntoLight(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: CupertinoIcons.bell,
                        textSize: 12,
                        title: "Remind me",
                        iconsize: 13,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        textSize: 12,
                        title: "Info",
                        iconsize: 13,
                      ),
                      kwidth,
                    ],
                  ),
                ],
              ),
              kheight,
              Text("Coming on ${DateFormat('EEEE').format(date)}"),
              kheight,
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(
                movieDescription,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: kgreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
