import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              onSaved: (newValue) {
                setState(() {
                  _email = newValue;
                });
              },
              validator: (value) {
                if (value != null &&
                    value.contains(RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"))) {
                  return null;
                }
                return 'Please enter a valid email';
              },
            ),
            TextFormField(
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
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width * 0.5,
                      MediaQuery.of(context).size.height * 0.06),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () async {
                if (_loginFormKey.currentState!.validate()) {
                  _loginFormKey.currentState!.save();
                  final bool result = await _firebaseService.loginUser(
                    email: _email!,
                    password: _password!,
                  );
                  if (result) Navigator.popAndPushNamed(context, 'home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
