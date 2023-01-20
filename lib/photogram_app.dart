import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

class PhotogramApp extends StatelessWidget {
  const PhotogramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Photogram',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        routes: {
          'register': (context) => const RegisterPage(),
          'login': (context) => const LoginPage(),
          'home': (context) => const HomePage(),
        },
        initialRoute: 'login',
      ),
    );
  }
}
