/*import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/constants/image_paths.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/core/widgets/customelevatedbutton.dart';
import 'package:meal_recommender/features/auth/presentation/cubit/checkbox_cubit.dart';
import 'package:meal_recommender/features/auth/presentation/widgets/customformfield.dart';
import 'package:meal_recommender/features/auth/presentation/widgets/customtext.dart';
import 'package:meal_recommender/features/auth/presentation/widgets/divider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckboxCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: BaseColorPalette.mainColor.withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImagePaths.logo),
                  CustomTextFormFiled(
                    hintText: 'User Name',
                    prefixIcon: Image.asset(IconPaths.account),
                  ),
                  CustomTextFormFiled(
                    hintText: 'Password',
                    prefixIcon: Image.asset(IconPaths.lock),
                    suffixIcon: Image.asset(IconPaths.eye),
                  ),
                  BlocBuilder<CheckboxCubit, CheckboxState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              value: state.isChecked,
                              onChanged: (_) => context
                                  .read<CheckboxCubit>()
                                  .toggleCheckbox(),
                              side: BorderSide(color: Colors.white, width: 1),
                              checkColor: Colors.black,
                              fillColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                          ),
                          TextWidget(
                            text: 'Remember me and keep me login',
                            size: 13,
                            color: BaseColorPalette.white,
                          ),
                        ],
                      );
                    },
                  ),
                  CustomElevatedButton(
                      onPressed: () {},
                      text: 'Login',
                      buttonColor: BaseColorPalette.white,
                      textColor: BaseColorPalette.mainColor),
                  customDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Image.asset(
                          IconPaths.facebook,
                          width: 35,
                          height: 35,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: BaseColorPalette.white,
                        child: Image.asset(
                          IconPaths.google,
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Don\'t have an account? ',
                        size: 18,
                        color: BaseColorPalette.white,
                      ),
                      InkWell(
                        onTap: () {},
                        child: TextWidget(
                          text: 'register',
                          size: 18,
                          color: BaseColorPalette.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/features/auth/domain/repositories/login_repo.dart';

import '../../../../../core/dl/Dependency_Injection.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'login_widget/login_view_bloc_consumer.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
 Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LoginCubit(sl.get<AuthRepo>()),
      child: Scaffold(
        body: LoginViewBlocConsumer(screenWidth: screenWidth, screenHeight: screenHeight),
      ),
    );
  }
}
