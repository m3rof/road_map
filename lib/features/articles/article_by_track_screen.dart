import 'package:flutter/material.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/styles.dart';

class ArticleByTrack extends StatelessWidget {
  const ArticleByTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'News Letters',
              style: TextStyle(color: ColorManager.primaryColor, fontSize: 25),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Front End',
                ),
                Tab(
                  text: 'Front End',
                ),
                Tab(
                  text: 'Front End',
                ),
                Tab(
                  text: 'Front End',
                ),
                Tab(text: 'Front End'),
              ],
              labelStyle: TextStyle(fontSize: 22),
              unselectedLabelColor: Colors.white,
              labelColor: ColorManager.primaryColor,
              indicatorColor: ColorManager.primaryColor,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.symmetric(horizontal: 30),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: ColorManager.primaryColor, width: 2),
                // Indicator height
                insets: EdgeInsets.symmetric(horizontal: 48),
              ),
            ),
          ),
          body: TabBarView(children: [

          ]),
        ));
  }
}
