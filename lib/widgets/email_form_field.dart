import 'package:flutter/material.dart';

import '../functions/email_validator.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.onEmailSaved,
  });

  final void Function(String?) onEmailSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Email'),
      onSaved: onEmailSaved,
      validator: emailValidator,
    );
  }
}
