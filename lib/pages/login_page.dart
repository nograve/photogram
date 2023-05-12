import 'package:flutter/material.dart';

import 'package:photogram/widgets/login_form.dart';
import 'package:photogram/widgets/register_page_link.dart';
import 'package:photogram/widgets/title_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleWidget(),
                LoginForm(),
                RegisterPageLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
