import 'package:flutter/material.dart';

import '../../../../../resourses/color_manager.dart';
import '../../../../../resourses/styles.dart';
import '../../../../../resourses/value_app.dart';

class WelcomeHome extends StatelessWidget {
  const WelcomeHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: PaddingManager.p16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [
              ColorManager.primaryColor,
              Colors.cyan,
            ],
          ),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Ahmed',style: StylesManager.welcomeHome,),
              SizedBox(height: SizeManager.s12,),
              Text('Let\'s learn',style: StylesManager.subWelcomeHome,),

            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1491472253230-a044054ca35f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGFwdG9wJTIwY29tcHV0ZXJ8ZW58MHx8MHx8fDA%3D'),
          )
        ],
      ),
    );
  }
}
