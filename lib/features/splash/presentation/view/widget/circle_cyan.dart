import 'package:flutter/material.dart';

import '../../../../../resourses/color_manager.dart';

class CircleCyan extends StatelessWidget {
  const CircleCyan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
            color: Color(0xa109f1fa),
            borderRadius: BorderRadius.only(topRight:Radius.circular(100),bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100))
        ),
      ),
    );
  }
}
