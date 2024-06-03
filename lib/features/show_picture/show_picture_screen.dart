import 'package:flutter/material.dart';
import 'package:road_map/resourses/assets_manager.dart';
import '../../resourses/color_manager.dart';
import '../../resourses/constants.dart';
import '../../resourses/value_app.dart';

class ShowPicture extends StatelessWidget {
  ShowPicture({required this.image,Key? key}) : super(key: key);
  String image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(iconTheme:const IconThemeData(color: Colors.white)),
      body: Column(
        children: [
          SizedBox(height: hightMedia(context: context, h: SizeManager.s_1),),
          Hero(
            tag: 'image2',
            child: Image.asset('assets/images/me.jpg'),
          ),
        ],
      ),
    );
  }
}
