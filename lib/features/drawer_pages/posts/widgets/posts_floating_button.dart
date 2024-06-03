
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../resourses/color_manager.dart';
import '../../../../resourses/value_app.dart';


class PostsFloatingButton extends StatelessWidget {
  const PostsFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme:const IconThemeData(color: Colors.white),
      backgroundColor: ColorManager.primaryColor,
      overlayColor: Colors.black,
      overlayOpacity: .4,
      spacing: SizeManager.s6,
      spaceBetweenChildren: SizeManager.s6,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.search_outlined),
          shape:const CircleBorder(),
          onTap: () {
          },
        ),
        SpeedDialChild(
          child:const Icon(Icons.add),
          shape:const CircleBorder(),
          onTap: () {
          },
        ),
      ],
    );
  }
}
