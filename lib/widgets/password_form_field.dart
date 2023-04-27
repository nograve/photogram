import 'package:flutter/material.dart';
import 'package:photogram/functions/password_validator.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    required this.onPasswordSaved,
    super.key,
  });

  // ignore: inference_failure_on_function_return_type
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
