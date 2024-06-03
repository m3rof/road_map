import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../features/show_picture/show_picture_screen.dart';

void moveScreen({required context, required dynamic screen}) {
  Navigator.of(context).push(PageTransition(
      duration: const Duration(milliseconds: 600),
      type: PageTransitionType.rightToLeft,
      child: screen));
}

void showImage(context, image) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ShowPicture(image: image)));
}