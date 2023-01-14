import 'package:flutter/material.dart';
import 'package:photogram/pages/home_page.dart';

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
        'register': (context) => RegisterPage(),
        'login': (context) => LoginPage(),
        'home': (context) => const HomePage(),
      },
      initialRoute: 'home',
    );
  }
}
