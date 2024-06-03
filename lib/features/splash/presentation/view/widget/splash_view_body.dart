import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:road_map/features/splash/presentation/view/widget/circle_cyan.dart';
import 'package:road_map/features/splash/presentation/view/widget/sliding_text.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/styles.dart';

import '../../../../authentication/login/presentation/view/login_view.dart';
import 'circle_blue.dart';
import 'filter_background.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    goToNextPage();
  }



  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          CircleBlue(),
          CircleCyan(),
          FilterSplash(),
          SlidingText(slidingAnimation: slidingAnimation)
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void goToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }
}
