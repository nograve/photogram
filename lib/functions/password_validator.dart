String? passwordValidator(String? password) {
  if (password != null && password.contains(
      // Minimum eight characters, at least one uppercase letter,
      // one lowercase letter and one number
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"))) {
    return null;
  }
  return 'Please enter a password with minimum eight characters, at least one '
      'uppercase letter, one lowercase letter and one number';
}
