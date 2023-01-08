import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.05,
      color: Colors.pink,
      child: const Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () {},
    );
  }
}
