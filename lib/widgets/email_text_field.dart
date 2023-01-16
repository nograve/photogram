import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final void Function(String)? emailOnSubmitted;

  const EmailTextField({
    required this.emailOnSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Email'),
      onFieldSubmitted: emailOnSubmitted,
      validator: (value) {
        if (value != null &&
            value.contains(RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"))) {
          return null;
        }
        return 'Please enter a valid email';
      },
    );
  }
}
