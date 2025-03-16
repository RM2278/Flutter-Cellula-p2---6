import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/routes/page_route_name.dart';
import '../../cubit/login_cubit/login_cubit.dart';
import '../../cubit/login_cubit/login_state.dart';
import 'login_page_body.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, PageRouteName.HomeView);
          //navigate
        }

        if (state is LoginFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: LoginPageBody(
             ),
        );
      },
    );
  }
}
void buildErrorBar(BuildContext context, String massage) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
      )
    );
  }