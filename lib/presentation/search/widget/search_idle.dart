import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';
import 'package:netflix/widget/constants.dart';
import 'package:shimmer/shimmer.dart';

const imageurl =
    "https://media.themoviedb.org/t/p/w220_and_h330_face/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheight,
        FutureBuilder(
          future: Api().getTopratedMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              );
            } else if (snapshot.hasData) {
              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => TopSearchItem(
                    movieName: snapshot.data![index].originalTitle,
                    moviePoster:
                        Constants.imagePath + snapshot.data![index].backDrop,
                  ),
                  separatorBuilder: (ctx, index) => kheight20,
                  itemCount: snapshot.data!.length,
                ),
              );
            } else {
              return SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              );
            }
          },
        )
      ],
    );
  }
}

class TopSearchItem extends StatefulWidget {
  final String movieName;
  final String moviePoster;
  const TopSearchItem({
    super.key,
    required this.movieName,
    required this.moviePoster,
  });

  @override
  State<TopSearchItem> createState() => _TopSearchItemState();
}

class _TopSearchItemState extends State<TopSearchItem> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: screenWidth.width * 0.34,
          height: screenWidth.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: CachedNetworkImage(
            imageUrl: widget.moviePoster,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
                width: screenWidth.width,
                height: screenWidth.height,
              ),
            ),
            placeholder: (context, url) => Shimmer(
              gradient: shimmerGradient,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.movieName,
            style: const TextStyle(
              color: kwhitecolor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kblackcolor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
