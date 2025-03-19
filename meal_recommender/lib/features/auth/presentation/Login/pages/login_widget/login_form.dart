import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';
import '../../cubit/checkbox_cubit.dart';
import '../../cubit/login_cubit/login_cubit.dart';
import '../../cubit/login_cubit/login_state.dart';
import '../../widgets/customtext.dart';
import '../../widgets/divider.dart';
import 'custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  late String email, password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _updateButtonState(BuildContext context) {
    final checkboxCubit = context.read<CheckboxCubit>();
    final loginCubit = context.read<LoginCubit>();

    loginCubit.updateButtonState(
      checkboxCubit.state.isChecked,
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _emailController,
            hintText: 'Email',
            prefixIcon: Image.asset(IconPaths.account),
            validator: _validateEmail,
            onChanged: (value) => _updateButtonState(context),
          ),
          SizedBox(height: screenHeight * 0.03),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            prefixIcon: Image.asset(IconPaths.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            isPassword: !_isPasswordVisible,
            validator: _validatePassword,
            onChanged: (value) => _updateButtonState(context),
          ),
          SizedBox(height: screenHeight * 0.01),
          BlocBuilder<CheckboxCubit, CheckboxState>(
            builder: (context, state) {
              return Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: state.isChecked,
                      onChanged: (value) {
                        context.read<CheckboxCubit>().toggleCheckbox();
                        _updateButtonState(context);
                      },
                      side: BorderSide(color: Colors.white, width: 1),
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                  const TextWidget(
                    text: 'Remember me and keep me login',
                    size: 13,
                    color: BaseColorPalette.white,
                  ),
                ],
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final loginCubit = context.read<LoginCubit>();
              bool isButtonEnabled = loginCubit.isButtonEnabled;
              bool isCheckboxChecked = loginCubit.isCheckboxChecked;

              return CustomElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<LoginCubit>().login(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );
                        }
                      }
                    : null,
                text: 'Login',
                buttonColor: isCheckboxChecked
                    ? (isButtonEnabled
                        ? BaseColorPalette.white
                        : Colors.white.withOpacity(0.7))
                    : Colors.red.withOpacity(0.5),
                textColor:
                    isButtonEnabled ? BaseColorPalette.mainColor : Colors.white,
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),
          const customDivider(),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }
}
