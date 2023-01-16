import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final void Function(String)? passwordOnSubmitted;

  const PasswordTextField({
    required this.passwordOnSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password'),
      onChanged: passwordOnSubmitted,
      validator: (value) {
        if (value != null && value.length > 6) {
          return null;
        }
        return 'Please enter a password greater than 6 characters';
      },
    );
  }
}
