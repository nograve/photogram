import 'package:flutter/material.dart';
import 'package:photogram/widgets/home_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photogram'),
        actions: [
          GestureDetector(
            onTap: null,
            child: const Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: GestureDetector(
              onTap: null,
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
