import 'package:flutter/material.dart';

import '../../../../../resourses/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LEARN',
                    style: StylesManager.splashText,
                  ),
                  Text(
                    'TO CODE',
                    style: StylesManager.splashText,
                  ),
                ],
              ),
            )
          );
        });
  }
}