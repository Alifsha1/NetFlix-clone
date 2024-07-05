import 'package:flutter/material.dart';

class VideoWidet extends StatelessWidget {
  const VideoWidet({
    super.key,
    required this.poster,
  });
  final String poster;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.28,
          child: Image.network(
            poster,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                size: 22,
              ),
            ),
          ),
        )
      ],
    );
  }
}
