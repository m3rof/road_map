import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../component/component.dart';
import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitialState());

  static PostsCubit get(context) => BlocProvider.of(context);

  List<PopupMenuEntry> menuePop(context, int idPost, int index) {
    return [
      PopupMenuItem(
          child: ListTile(
            onTap: () {

            },
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('edit post'),
          )),
      PopupMenuItem(
          child: ListTile(
            onTap: () {
              askDialogAwsome(context, 'Are you sure', DialogType.question, () {
              });
            },
            leading: Icon(FontAwesomeIcons.trash),
            title: Text('delete post'),
          ))
    ];
  }



}
