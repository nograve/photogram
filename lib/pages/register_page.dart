import 'package:flutter/material.dart';

import 'package:photogram/widgets/register_button.dart';
import 'package:photogram/widgets/register_title_widget.dart';
import 'package:photogram/widgets/registration_form.dart';

class RegisterPage extends StatelessWidget {
  final registerFormKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RegisterTitleWidget(),
                RegistrationForm(registerFormKey: registerFormKey),
                RegisterButton(registerFormKey: registerFormKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
