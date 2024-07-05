import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/models/movie.dart';
import 'package:netflix/presentation/search/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
    required this.searchValue,
  });

  final String searchValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Tv'),
        kheight,
        FutureBuilder(
          future: Api().getpopularSeries(),
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
               List<Movie> list =  snapshot.data!
                  .where((element) => element.title.toLowerCase().contains(searchValue.toLowerCase())).toList();
              return Expanded(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.4,
                    children: List.generate(list.length, (index) {
                      return SearchResultCard(
                        image:  list[index].posterPath,
                      );
                    })),
              );
            } else {
              throw Exception('Something went wrong');
            }
          },
        )
      ],
    );
  }
}

class SearchResultCard extends StatelessWidget {
  final String image;
  const SearchResultCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
