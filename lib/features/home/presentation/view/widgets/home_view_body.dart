import 'package:flutter/material.dart';
import 'package:road_map/resourses/assets_manager.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/styles.dart';
import 'package:road_map/resourses/value_app.dart';

import 'welcome_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WelcomeHome(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
          child: Text(
            'Get to know your skills and improve them ',
            style: StylesManager.welcomeLR,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Image.network(
          'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNDZ6M291dGJmM2piZGV2bnlzbDVwejNvaG5lb3RjMW5zanB1cWhmOCZlcD12MV9naWZzX3NlYXJjaCZjdD1n/VbnUQpnihPSIgIXuZv/giphy.gif',
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
          child: Text(
              'learn and explore new skills through courses and good opportunities',
              style: StylesManager.welcomeLR
                  .copyWith(fontWeight: FontWeight.w400)),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Get Started', style: StylesManager.buttonStyle),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(radius: 10,backgroundColor: ColorManager.primaryColor,),
              Container(
                padding: EdgeInsets.only(top: SizeManager.s12),
                  height: 80,
                  width: 260,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.headBlack)),
                  child: Text(
                    'Our Features',
                    style:
                        StylesManager.welcomeLR.copyWith(fontSize: SizeManager.s35),
                    textAlign: TextAlign.center,
                  )),
              CircleAvatar(radius: 10,backgroundColor: ColorManager.primaryColor,),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image(image: AssetImage(AssetsManager.road)),
                  SizedBox(width: SizeManager.s10,),
                  Text('Road Map',style: StylesManager.welcomeHome.copyWith(color: ColorManager.headBlack),),
                  Text('data',style: StylesManager.subWelcomeHome.copyWith(color: ColorManager.headBlack),),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
