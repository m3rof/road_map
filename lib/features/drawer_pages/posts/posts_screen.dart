import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map/features/drawer_pages/posts/posts_cubit/posts_cubit.dart';
import 'package:road_map/features/drawer_pages/posts/posts_cubit/posts_state.dart';
import 'package:road_map/features/drawer_pages/posts/widgets/posts_floating_button.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/styles.dart';

import '../../../component/component.dart';
import '../../../resourses/value_app.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topics',
          style: StylesManager.welcomeHome.copyWith(
              color: ColorManager.primaryColor, fontSize: 26))),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = PostsCubit.get(context);
          return
            CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(SizeManager.s10),
                  child: listViewQAV(
                      'I feel anxious always and moody and feel lonely, sometimes i think in suiside ',
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetur adipisicing Lorem ipsum dolor sit amet,',
                      'Mazin Asaad',
                      'The head of psychology department - alex university'),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: PostsFloatingButton(),
    );
  }
}
