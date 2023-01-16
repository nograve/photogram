import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:photogram/services/firebase_service.dart';

class LoginButton extends StatelessWidget {
  final FirebaseService firebaseService = GetIt.instance.get<FirebaseService>();
  final GlobalKey<FormState> loginFormKey;
  final String? email;
  final String? password;

  void loginUser() {}

  LoginButton({
    required this.loginFormKey,
    required this.email,
    required this.password,
    super.key,
  });

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
      onPressed: () async {
        if (loginFormKey.currentState!.validate()) {
          bool result = await firebaseService.loginUser(
            email: email!,
            password: password!,
          );
          if (result) Navigator.popAndPushNamed(context, 'home');
        }
      },
    );
  }
}
