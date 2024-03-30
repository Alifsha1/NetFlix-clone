import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widget/background_card.dart';
import 'package:netflix/presentation/home/widget/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(valueListenable: scrollNotifier, builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          if (direction == ScrollDirection.reverse) {
            scrollNotifier.value = false;
          } else if (direction == ScrollDirection.forward) {
            scrollNotifier.value = true;
          }
          return true;
        },
        child: ListView(
          children: [
            BackgroundCard(),
            MainTiltleCard(title: 'Released in the Past year'),
            MainTiltleCard(
              title: 'Trending Now',
            ),
            kheight,
            NumberTitleCard(),
            kheight,
            MainTiltleCard(
              title: 'Tense Dramas',
            ),
            MainTiltleCard(
              title: 'South Indian cinema',
            ),
          ],
        ),
      );
      }),
    );
  }
}
