import 'package:flutter/material.dart';

import 'package:photogram/widgets/email_text_field.dart';
import 'package:photogram/widgets/login_button.dart';
import 'package:photogram/widgets/password_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmailTextField(emailOnSubmitted: (value) {
              setState(() {
                _email = value;
              });
            }),
            PasswordTextField(passwordOnSubmitted: (value) {
              setState(() {
                _password = value;
              });
            }),
            LoginButton(
              loginFormKey: _loginFormKey,
              email: _email,
              password: _password,
            ),
          ],
        ),
      ),
    );
  }
}
