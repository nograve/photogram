import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.onPasswordSaved,
  });

  final Function(String?) onPasswordSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password'),
      onSaved: onPasswordSaved,
      validator: (password) {
        if (password != null && password.length > 6) {
          return null;
        }
        return 'Please enter a password greater than 6 characters';
      },
    );
  }
}
