import 'package:flutter/material.dart';
import 'package:photogram/pages/register_page.dart';

class RegisterPageLink extends StatelessWidget {
  const RegisterPageLink({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const RegisterPage(),
        ),
      ),
      child: const Text(
        "Don't have an account?",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
