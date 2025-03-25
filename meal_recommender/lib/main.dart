import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/core/routes/app_router.dart';
import 'package:meal_recommender/core/themes/application_theme_manager.dart';
import 'core/dl/Dependency_Injection.dart';
import 'core/routes/app_views.dart';
import 'core/services/cubit_observer.dart';
import 'core/services/shared_preferences_storage_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  intl();
  Bloc.observer = AppCubitObserver();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightThemeData,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: PageRouteName.homeView,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
