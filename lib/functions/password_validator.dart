String? passwordValidator(String? password) {
  if (password != null && password.length > 6) {
    return null;
  }
  return 'Please enter a password with 6 or more characters';
}
