import 'package:flutter/material.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/value_app.dart';

class StylesManager {
  static TextStyle splashText = const TextStyle(
      color: ColorManager.headBlack,
      fontWeight: FontWeight.bold,
      fontSize: SizeManager.s40,
      fontFamily: 'pac');

  static TextStyle welcomeLR = const TextStyle(
      color: ColorManager.headBlack,
      fontWeight: FontWeight.bold,
      fontSize: SizeManager.s24,
      );
  static TextStyle hint = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: SizeManager.s18,
  );
  static TextStyle styleField = const TextStyle(
    color: ColorManager.headBlack,
    fontWeight: FontWeight.w400,
    fontSize: SizeManager.s18,
  );
  static TextStyle buttonStyle = const TextStyle(
    color: ColorManager.textButtonColor,
    fontWeight: FontWeight.w400,
    fontSize: SizeManager.s20,
  );
  static TextStyle textMove = const TextStyle(color: ColorManager.primaryColor, fontSize: SizeManager.s18);
  static TextStyle accountDont = const TextStyle(color: ColorManager.headBlack, fontSize: SizeManager.s16);

  static TextStyle resetSubPassword = const TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w400,
    fontSize: SizeManager.s18,
  );

  static TextStyle welcomeHome = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: SizeManager.s30,
  );
  static TextStyle subWelcomeHome = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: SizeManager.s22,
  );

}


