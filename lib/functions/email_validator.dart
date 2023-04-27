String? emailValidator(String? email) {
  if (email != null &&
      email.contains(
        RegExp(
          r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$',
        ),
      )) {
    return null;
  }
  return 'Please enter a valid email';
}
