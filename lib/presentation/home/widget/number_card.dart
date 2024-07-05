import 'package:bordered_text/bordered_text.dart';

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  // ignore: prefer_typing_uninitialized_variables
  final image;
  const NumberCard({
    super.key,
    required this.index,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kradius10,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image))),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 3.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 140,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.black,
                decorationColor: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
