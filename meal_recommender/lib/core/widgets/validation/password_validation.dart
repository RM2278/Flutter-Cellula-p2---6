String? passwordValidation(text) {
  if (text == null || text.trim().isEmpty) {
    return "Please enter your Password";
  }
  bool isValidPassword =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(text);
  if (!isValidPassword) {
    return "Your password should contain \n"
        "At least one uppercase letter (A-Z) \n"
        "At least one lowercase letter (a-z) \n"
        "At least one digit (0-9) \n"
        "At least one special character from the set {!@#&~} \n"
        "Minimum length of 8 characters";
  }
  return null;
}