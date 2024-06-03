import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:road_map/features/drawer_pages/posts/posts_cubit/posts_state.dart';
import 'package:road_map/resourses/color_manager.dart';

import '../../../../component/component.dart';
import '../../../../resourses/styles.dart';
import '../../../../resourses/value_app.dart';
import '../posts_cubit/posts_cubit.dart';

class CommentsScreen extends StatefulWidget {
  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late TextEditingController comment;

  @override
  void initState() {
    comment = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = PostsCubit.get(context);

          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) =>
                          itemCommentsCommunity(cubit),
                      itemCount: 5)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: comment,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.send,
                          color: Colors.black,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Enter your comment..',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeManager.s30)),
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeManager.s30)),
                          borderSide: BorderSide(color: Colors.transparent)),
                      // prefixIcon: prefixIcon,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class itemCommentsCommunity extends StatelessWidget {
  // String namePublisher;
  // String doctorProfileImage;
  // String mainTitle;
  // String date;
  // int reaction;
  // bool reactionByUser;
  //
  // itemCommentsBlog(this.namePublisher, this.mainTitle, this.date, this.reaction,
  //     this.reactionByUser,this.doctorProfileImage);

  PostsCubit postsCubit;

  itemCommentsCommunity(this.postsCubit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeManager.s20, right: SizeManager.s22, top: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileImage(
                  image: NetworkImage(
                      'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=1483'),
                  height: SizeManager.s65,
                  width: SizeManager.s65,
                  radius: SizeManager.s35),
              const SizedBox(
                width: SizeManager.s30,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(SizeManager.s6),
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeManager.s16)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mahmoud Gamal',
                            style: StylesManager.textMove.copyWith(
                                color: Colors.black,
                                fontSize: SizeManager.s20,
                                fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          popMenu(
                              postsCubit.menuePop(context, 1, 1),
                              const Icon(
                                FontAwesomeIcons.ellipsisH,
                                color: ColorManager.primaryColor,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: SizeManager.s8,
                      ),
                      Text(
                        'osama and ashraf and omar omaromaromaromaromaromaromar',
                        style: StylesManager.textMove.copyWith(
                          fontSize: SizeManager.s18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: SizeManager.s8,
                      ),
                      Row(
                        children: [
                          Text(
                            '2023-11-05',
                            style: StylesManager.hint,
                          ),
                          const SizedBox(
                            width: SizeManager.s8,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          dividerBlue(
            width: 400,
            color: ColorManager.primaryColor,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
