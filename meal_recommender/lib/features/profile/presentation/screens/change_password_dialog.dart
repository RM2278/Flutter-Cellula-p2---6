import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/themes/color_palette.dart';
import '../widgets/custom_text_field.dart';


class ChangePasswordDialog {
  static void show({
    required BuildContext context,
    required TextEditingController passwordController,
    required TextEditingController newPasswordController,
    required Future<bool> Function() onSave,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        String? errorMessage;
        bool obscureCurrentPassword = true;
        bool obscureNewPassword = true;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Center(
                child: Text(
                 Constants.ChangePassword,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: BaseColorPalette.mainColor,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (errorMessage != null)
                      Card(
                        color: Colors.red.shade100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.error, color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  errorMessage!,
                                  style: const TextStyle(color: Colors.red, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      labelText: Constants.ChangePassword,
                      obscureText: obscureCurrentPassword,
                      onToggleObscure: () {
                        setState(() {
                          obscureCurrentPassword = !obscureCurrentPassword;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: newPasswordController,
                      labelText: Constants.CurrentPassword,
                      obscureText: obscureNewPassword,
                      onToggleObscure: () {
                        setState(() {
                          obscureNewPassword = !obscureNewPassword;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          passwordController.clear();
                          newPasswordController.clear();
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red.shade700,
                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        child: const Text(Constants.Cancel),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() => errorMessage = null);
                          bool success = await onSave();
                          if (success) {
                            passwordController.clear();
                            newPasswordController.clear();
                            Navigator.pop(context);
                          } else {
                            setState(() => errorMessage = Constants.Incorrectpassword);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BaseColorPalette.mainColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(Constants.Save),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

