import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/styles.dart';


import 'value_app.dart';

class ThemeManager {
  static ThemeData themeData=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorManager.primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity,50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeManager.s10)), // <-- Radius
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: SizeManager.s150, vertical: SizeManager.s10),
          primary: ColorManager.primaryColor,
        ),
      ),

      appBarTheme: const AppBarTheme(
      backgroundColor:Color(0xff1c1b1c) ,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.primaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light)),

  );



}
