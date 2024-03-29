import 'package:flutter/material.dart';

import 'package:photogram/widgets/registration_form.dart';
import 'package:photogram/widgets/title_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TitleWidget(),
                RegistrationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
