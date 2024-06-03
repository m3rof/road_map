import 'package:flutter/material.dart';
import 'package:road_map/component/component.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/constants.dart';
import 'package:road_map/resourses/value_app.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerBody(),
      appBar:  AppBar(
        leading: appBarLeading(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) => CourseHomeItem(
                  'https://media.geeksforgeeks.org/wp-content/uploads/20240319155102/what-is-ai-artificial-intelligence.webp',
                  'Artifical Intellegience',
                  'good course for artifiacl intellegience will take you from the basic good course for artifiacl intellegience will take you from the basic'),itemCount: 6,),
            )
            
          ],
        ),
      ),
    );
  }
}

class CourseHomeItem extends StatelessWidget {
  CourseHomeItem(this.image, this.title, this.text, {super.key});

  String image;
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                child: Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              SizedBox(
                height: SizeManager.s20,
              ),
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: SizeManager.s10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    )),
              ),
              SizedBox(
                height: SizeManager.s20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeManager.s20,
        ),
        dividerBlue(
            width: 400,
            color: Colors.grey,
            thickness: .5,
            height: 4),
        SizedBox(
          height: SizeManager.s20,
        ),
      ],
    );
  }
}
