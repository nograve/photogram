import 'package:flutter/material.dart';

class PhotogramApp extends StatelessWidget {
  const PhotogramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photogram',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Scaffold(),
    );
  }
}
