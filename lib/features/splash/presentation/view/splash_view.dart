import 'package:flutter/material.dart';
import 'package:road_map/features/splash/presentation/view/widget/splash_view_body.dart';
import 'package:road_map/resourses/color_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SplashViewBody(),
    );
  }
}
