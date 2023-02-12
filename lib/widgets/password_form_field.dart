import 'package:flutter/material.dart';
import 'package:photogram/functions/password_validator.dart';

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
      validator: passwordValidator,
    );
  }
}
