import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/assets/assets.dart';
import 'package:netflix/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class ListViewLoading extends StatelessWidget {
  const ListViewLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            width: size.width * 0.35,
            height: size.height * 0.23,
            child: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorLoading extends StatelessWidget {
  const ErrorLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            width: size.width * 0.35,
            height: size.height * 0.23,
            child: Shimmer(
              period: const Duration(seconds: 2),
              gradient: shimmerGradient,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.black,
                    image:  DecorationImage(
                      image: NetworkImage(imageList[0]),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}