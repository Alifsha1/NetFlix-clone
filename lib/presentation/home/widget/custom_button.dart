import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconsize = 25,
    this.textSize=18,
  });
  final IconData icon;
  final String title;
  final double iconsize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhitecolor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
