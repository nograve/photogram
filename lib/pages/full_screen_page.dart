import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPage extends StatelessWidget {
  const FullScreenPage({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PhotoView(imageProvider: NetworkImage(url)),
      ),
    );
  }
}
