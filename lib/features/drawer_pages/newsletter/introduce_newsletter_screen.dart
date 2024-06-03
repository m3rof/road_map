import 'dart:math';

import 'package:flutter/material.dart';
import 'package:road_map/resourses/assets_manager.dart';
import 'package:road_map/resourses/constants.dart';
import 'package:road_map/resourses/styles.dart';
import 'package:road_map/resourses/value_app.dart';

class IntroduceNewsLetterScreen extends StatelessWidget {
  const IntroduceNewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://imgeng.jagran.com/images/2023/dec/Best%20Laptop%20Company%20In%20India1702456590117.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                greyContainerText(
                    text: 'Welcome to our',
                    styleText: StylesManager.subWelcomeHome
                        .copyWith(fontSize: 16, color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                greyContainerText(
                    text: 'Weekly NewsLetters',
                    styleText: StylesManager.subWelcomeHome
                        .copyWith(fontSize: 25, color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    'how are you welcome to our weekly how are you welcome to our weekly how are you welcome to our weekly how are you welcome to our weekly how are you welcome to our weekly',
                    style: StylesManager.subWelcomeHome.copyWith(fontSize: 22),
                  )
                ],
              ),
            ),
            SizedBox(
              height: hightMedia(context: context, h: .1),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                greyContainerText(
                    text: 'Get Started',
                    styleText: StylesManager.subWelcomeHome
                        .copyWith(fontSize: 25, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class greyContainerText extends StatelessWidget {
  greyContainerText({required this.text, this.styleText});

  String text;
  TextStyle? styleText = StylesManager.subWelcomeHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.grey.withAlpha(150),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(text, style: styleText),
    );
  }
}
