import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/core/routes/app_router.dart';
import 'package:meal_recommender/core/themes/application_theme_manager.dart';
import 'core/routes/app_views.dart';
import 'core/services/cubit_observer.dart';

void main() {
  Bloc.observer = AppCubitObserver();
  runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightThemeData,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: PageRouteName.initial,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
