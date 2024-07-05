import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/models/movie.dart';
import 'package:netflix/presentation/home/widget/background_card.dart';
import 'package:netflix/presentation/home/widget/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> recentReleased;
  late Future<List<Movie>> popular;
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topratedMovies = Api().getTopratedMovies();
    recentReleased = Api().getrecentRelasedMovies();
    popular = Api().getpopularSeries();
  }

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    const BackgroundCard(),
                    MainTiltleCard(
                      title: 'Released in the Past year',
                      type: topratedMovies,
                      size: size,
                    ),
                    MainTiltleCard(
                      title: 'Trending Now',
                      type: trendingMovies,
                      size: size,
                    ),
                    kheight,
                    const NumberTitleCard(),
                    kheight,
                    MainTiltleCard(
                      title: 'Tense Dramas',
                      type: recentReleased,
                      size: size,
                    ),
                    MainTiltleCard(
                      title: 'South Indian cinema',
                      type: popular,
                      size: size,
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://w0.peakpx.com/wallpaper/134/43/HD-wallpaper-netflix-netflix-site.jpg",
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kwidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            kheight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: khomeTitleText),
                                Text(
                                  'Movies',
                                  style: khomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: khomeTitleText,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
