import 'package:flutter/material.dart';

import '../widgets/login_form.dart';
import '../widgets/register_page_link.dart';
import '../widgets/title_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
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
