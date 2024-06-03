import 'dart:ui';

import 'package:flutter/material.dart';

class FilterSplash extends StatelessWidget {
  const FilterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter:  ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child:  Container(
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5))));
  }
}
