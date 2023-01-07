import 'package:flutter/material.dart';

import 'package:photogram/pages/login_page.dart';
import 'package:photogram/pages/register_page.dart';

class PhotogramApp extends StatelessWidget {
  const PhotogramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photogram',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        'register': (context) => const RegisterPage(),
        'login': (context) => LoginPage(),
      },
      initialRoute: 'login',
    );
  }
}
