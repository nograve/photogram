import 'package:flutter/material.dart';

import 'package:photogram/functions/email_validator.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    required this.onEmailSaved,
    super.key,
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
