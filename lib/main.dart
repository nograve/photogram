import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:overlay_support/overlay_support.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.instance.registerSingleton<FirebaseService>(FirebaseService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
