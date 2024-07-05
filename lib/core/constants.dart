import 'package:flutter/material.dart';

const kwidth = SizedBox(width: 10);
const kheight = SizedBox(height: 10);
const kheight20 = SizedBox(height: 20);
const kheight50 = SizedBox(height: 50);

//Border Radius

BorderRadius kradius10 = BorderRadius.circular(10);
BorderRadius kradius30 = BorderRadius.circular(30);

//Image

const kmainImage =
    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg";

//tempimage

const newandhosttempimage = "https://media.themoviedb.org/t/p/w355_and_h200_multi_faces/wex2zlKvO33bnxQnwaLlxniYNAI.jpg";
//Text Style

TextStyle khomeTitleText = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
//shimmergradiant

final shimmerGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Colors.grey[900]!,
    Colors.grey[900]!,
    Colors.grey[800]!,
    Colors.grey[900]!,
    Colors.grey[900]!
  ],
  stops: const <double>[0.0, 0.35, 0.5, 0.65, 1.0],
);