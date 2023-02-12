import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:photogram/widgets/email_text_field.dart';
import 'package:photogram/widgets/password_text_field.dart';

import '../services/firebase_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseService _firebaseService =
      GetIt.instance.get<FirebaseService>();
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
            EmailTextField(onEmailSaved: (newEmail) {
              setState(() {
                _email = newEmail;
              });
            }),
            PasswordTextField(onPasswordSaved: (newPassword) {
              setState(() {
                _password = newPassword;
              });
            }),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width * 0.5,
                      MediaQuery.of(context).size.height * 0.06),
                ),
              ),
              onPressed: () async {
                if (_loginFormKey.currentState!.validate()) {
                  _loginFormKey.currentState!.save();
                  final String? result = await _firebaseService.loginUser(
                    email: _email!,
                    password: _password!,
                  );
                  if (result == null) {
                    if (context.mounted) {
                      Navigator.popAndPushNamed(context, 'home');
                    }
                  } else {
                    showSimpleNotification(
                      Text(result),
                      background: Colors.grey,
                    );
                  }
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
