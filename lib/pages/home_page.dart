import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/firebase_service.dart';
import 'feed_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseService _firebaseService =
      GetIt.instance.get<FirebaseService>();
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    FeedPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photogram'),
        actions: [
          GestureDetector(
            onTap: () async {
              final result =
                  await FilePicker.platform.pickFiles(type: FileType.image);
              if (result != null) {
                final image = File(result.files.first.path!);
                await _firebaseService.postImage(image);
              }
            },
            child: const Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: GestureDetector(
              onTap: () async {
                await _firebaseService.logOut();
                if (context.mounted) {
                  Navigator.popAndPushNamed(context, 'login');
                }
              },
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (int selectedPageIndex) {
          setState(() {
            _currentPageIndex = selectedPageIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Feed',
            icon: Icon(Icons.feed),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
