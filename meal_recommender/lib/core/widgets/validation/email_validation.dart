String? emailValidation(text) {
  if (text == null || text.trim().isEmpty) {
    return "Please enter your Email Address";
  }
  bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);
  if (!emailValid) {
    return "Please enter valid email";
  }
  return null;
}