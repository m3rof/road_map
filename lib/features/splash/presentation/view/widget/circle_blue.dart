import 'package:flutter/material.dart';

import '../../../../../resourses/color_manager.dart';

class CircleBlue extends StatelessWidget {
  const CircleBlue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(100),topRight:Radius.circular(100),bottomLeft: Radius.circular(100),)
        ),
      ),
    );
  }
}
