
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/widget/constants.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 Tv Shows in India today',
        ),
        FutureBuilder(
          future: Api().getTopratedMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => NumberCard(
                      image: Constants.imagePath +
                          snapshot.data![index].posterPath,
                      index: index,
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
