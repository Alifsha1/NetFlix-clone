import 'package:flutter/material.dart';
import 'package:netflix/domain/models/movie.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/widget/constants.dart';
import 'package:netflix/widget/listview_loading.dart';

class MainTiltleCard extends StatefulWidget {
  final String title;
  final Future<List<Movie>> type;
  final Size size;
  const MainTiltleCard({
    super.key,
    required this.title,
    required this.type,
    required this.size,
  });

  @override
  State<MainTiltleCard> createState() => _MainTiltleCardState();
}

class _MainTiltleCardState extends State<MainTiltleCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: widget.title,
        ),
        FutureBuilder(
            future: widget.type,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ErrorLoading(size: widget.size);
              } else if (snapshot.hasData) {
                return LimitedBox(
                  maxHeight: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => MainCard(
                        snapshot: snapshot,
                        image: Constants.imagePath +
                            snapshot.data![index].posterPath,
                      ),
                    ),
                  ),
                );
              } else {
                return ListViewLoading(size: widget.size);
              }
            })
      ],
    );
  }
}
