import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String? _password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password'),
      onSaved: (newValue) {
        setState(() {
          _password = newValue;
        });
      },
      validator: (value) {
        if (value != null && value.length > 6) {
          return null;
        }
        return 'Please enter a password greater than 6 characters';
      },
    );
  }
}
