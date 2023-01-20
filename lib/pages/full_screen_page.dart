import 'package:flutter/material.dart';

class FullScreenPage extends StatelessWidget {
  const FullScreenPage({
    super.key,
    required this.url,
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
