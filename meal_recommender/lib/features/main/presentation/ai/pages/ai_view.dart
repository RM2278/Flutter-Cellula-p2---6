import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/core/widgets/custom_text_form_filed.dart';



import '../../../../../core/dl/Dependency_Injection.dart';
import '../manager/dish_bloc.dart';
import '../widgets/ai_body.dart';


class AiView extends StatelessWidget {
  AiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_sharp,
                color: BaseColorPalette.mainColor,
                size: MediaQuery.of(context).size.width * 0.07
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                  Icons.notifications,
                  color: BaseColorPalette.mainColor,
                  size: MediaQuery.of(context).size.width  * 0.07
              ),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => sl<DishBloc>(),
          child: AiBody(),
        )
    );
  }
}