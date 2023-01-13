import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;

  const LoginButton({required this.loginFormKey, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      color: Colors.pink,
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        if (loginFormKey.currentState!.validate()) {
          loginFormKey.currentState!.save();
        }
      },
    );
  }
}
