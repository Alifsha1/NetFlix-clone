import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.snapshot,
    required this.image
  });
  final image;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kradius10,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image))),
    );
  }
}
