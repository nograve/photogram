import 'package:flutter/material.dart';

class RegisterTitleWidget extends StatelessWidget {
  const RegisterTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Photogram',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
