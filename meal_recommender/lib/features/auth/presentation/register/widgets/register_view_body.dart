import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/constants/image_paths.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../core/widgets/text_widget.dart';
import '../../../../../core/widgets/validation/email_validation.dart';
import '../../../../../core/widgets/validation/password_validation.dart';
import '../../Login/pages/login_widget/social_login_buttons.dart';
import '../../Login/widgets/divider.dart';
import '../cubit/register_cubit.dart';
import 'login_text.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late RegisterCubit registerCubit;

  @override
  void initState() {
    super.initState();
    registerCubit = RegisterCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc: registerCubit,
      listener: (context, state) {
        if (state is RegisterLoading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is RegisterNotValid) {
          Navigator.pushNamed(context, PageRouteName.verificationView);
        } else if (state is RegisterValid) {
          const SnackBar(content: Text('Create account and valid'));
        }
      },
      child: Scaffold(
        //backgroundColor: BaseColorPalette.mainColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagePaths.backGround,
                ),
                fit: BoxFit.fill),
          ),
          child: Container(
            color: BaseColorPalette.mainColor.withOpacity(0.9),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        ImagePaths.logo,
                      ),
                    ),
                    Form(
                      key: registerCubit.key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextFormFiled(
                            prefixIcon: Image.asset(IconPaths.account),
                            hintText: 'Full Name',
                            controller: registerCubit.fullNameController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your full name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextFormFiled(
                            prefixIcon: Image.asset(IconPaths.account),
                            hintText: 'Email Address',
                            controller: registerCubit.emailController,
                            validator: emailValidation,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextFormFiled(
                            prefixIcon: Image.asset(IconPaths.account),
                            hintText: 'Phone',
                            controller: registerCubit.phoneController,
                            keyBoardType: TextInputType.number,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your Password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          CustomTextFormFiled(
                            prefixIcon: Image.asset(IconPaths.lock),
                            hintText: 'Password',
                            controller: registerCubit.passwordController,
                            isObscure: registerCubit.isVisible,
                            suffixIcon: IconButton(
                              color: BaseColorPalette.white,
                              onPressed: () {
                                setState(() {
                                  registerCubit.isVisible =
                                      !registerCubit.isVisible;
                                });
                              },
                              icon: Icon(
                                registerCubit.isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                            validator: passwordValidation,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                    activeColor: BaseColorPalette.white,
                                    checkColor: BaseColorPalette.mainColor,
                                    side: const BorderSide(
                                      color: BaseColorPalette.white,
                                    ),
                                    value: registerCubit.value,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        registerCubit.value = newValue!;
                                      });
                                    }),
                              ),
                              Expanded(
                                child: const TextWidget(
                                  text:
                                      "By creating an account you agree to terms and conditions",
                                  size: 11,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          CustomElevatedButton(
                            buttonColor: registerCubit.value
                                ? BaseColorPalette.white
                                : Colors.grey,
                            onPressed: () async {
                              if (registerCubit.key.currentState!.validate()) {
                                registerCubit.value
                                    ? await registerCubit.register()
                                    : null;
                              }
                            },
                            text: 'Register',
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          //-----or login ------
                          customDivider(),
                          //Google
                          SocialLoginButtons(),
                          SizedBox(
                            height: 15,
                          ),
                          //go to screen login
                          LoginText(),
                          /*Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextWidget(
                                text: "Do you have account ?",
                                size: 18,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const TextWidget(
                                  text: 'Login now',
                                  size: 18,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
