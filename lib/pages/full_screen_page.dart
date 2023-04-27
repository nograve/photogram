import 'package:flutter/material.dart';

class FullScreenPage extends StatelessWidget {
  const FullScreenPage({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        url,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
