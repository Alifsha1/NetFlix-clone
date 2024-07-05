import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widget/comingsoon_card.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyones_watching_widget.dart';
import 'package:netflix/widget/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              Row(
                children: [
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
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kblackcolor,
              unselectedLabelColor: kwhitecolor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator:
                  BoxDecoration(color: kwhitecolor, borderRadius: kradius30),
              tabs: const [
                Tab(
                  text: "🍿 coming soon",
                ),
                Tab(
                  text: "Everyone's watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryoneWatcing(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return FutureBuilder(
      future: Api().getrecentRelasedMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: List.generate(
              snapshot.data!.length,
              (index) => ComingSoonWidget(
                movieName: snapshot.data![index].originalTitle,
                movieDescription: snapshot.data![index].overView,
                moviePoster:
                    Constants.imagePath + snapshot.data![index].backDrop,
                date: snapshot.data![index].releaseDate,
              ),
            ),
          );
        } else {
          throw Exception('something wrong');
        }
      },
    );
  }

  Widget _buildEveryoneWatcing() {
    return FutureBuilder(
      future: Api().getTrendingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: List.generate(
              snapshot.data!.length,
              (index) => EveryOneWatchingWidget(
                movieName: snapshot.data![index].originalTitle,
                movieDescription: snapshot.data![index].overView,
                poster: Constants.imagePath + snapshot.data![index].posterPath,
              ),
            ),
          );
        } else {
          throw Exception('Something wrong');
        }
      },
    );
  }
}
