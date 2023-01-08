import 'package:flutter/material.dart';

import 'package:photogram/widgets/login_button.dart';
import 'package:photogram/widgets/login_form.dart';
import 'package:photogram/widgets/register_page_link.dart';
import 'package:photogram/widgets/title_widget.dart';

class LoginPage extends StatelessWidget {
  final loginFormKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleWidget(),
                LoginForm(loginFormKey: loginFormKey),
                LoginButton(loginFormKey: loginFormKey),
                const RegisterPageLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
