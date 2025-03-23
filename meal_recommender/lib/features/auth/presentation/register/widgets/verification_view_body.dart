import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/widgets/custom_elevated_button.dart';
import 'package:meal_recommender/core/widgets/text_widget.dart';


import '../../../../../core/constants/image_paths.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/themes/color_palette.dart';
import '../cubit/register_cubit.dart';

class VerificationViewBody extends StatelessWidget {
   VerificationViewBody({super.key});
  RegisterCubit registerCubit = RegisterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(
      bloc: registerCubit,
      listener: (context,state){
     if (state is RegisterNotValid) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Create account but not valid')),
    );
    } else if (state is RegisterValid) {
    Navigator.pushNamed(context, PageRouteName.homeView);
    }},
      child: Scaffold(
        backgroundColor: BaseColorPalette.mainColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Image.asset(
                      ImagePaths.logo,
                    ),
                  ),
                  const TextWidget(
                    align: TextAlign.center,
                    text: "Verification Email",
                    size: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  const TextWidget(
                    align: TextAlign.center,
                    text: "Check your inbox ",
                    size: 18,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  CustomElevatedButton(
                    onPressed: () async{
                      await registerCubit.Reload();
                    },
                    text: "Continue",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
