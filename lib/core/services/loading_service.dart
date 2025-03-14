import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wanderingCubes
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = BaseColorPalette.white
    ..backgroundColor = Colors.black.withOpacity(0.6)
    ..indicatorColor = BaseColorPalette.white
    ..textColor = BaseColorPalette.white
    ..maskColor = Colors.black.withOpacity(0.6)
    ..userInteractions = true
    ..dismissOnTap = false;
}
