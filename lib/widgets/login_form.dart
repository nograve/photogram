import 'package:flutter/material.dart';

import 'package:photogram/widgets/email_text_field.dart';
import 'package:photogram/widgets/password_text_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;
  const LoginForm({
    required this.loginFormKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            EmailTextField(),
            PasswordTextField(),
          ],
        ),
      ),
    );
  }
}
