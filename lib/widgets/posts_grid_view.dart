import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:photogram/pages/full_screen_page.dart';
import 'package:photogram/services/firebase_service.dart';

class PostsGridView extends StatelessWidget {
  PostsGridView({super.key});

  final FirebaseService firebaseService = GetIt.instance.get<FirebaseService>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firebaseService.getPostsForUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.data!.docs.map((e) => e.data()).toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => FullScreenPage(
                          url: post['image'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(post['image'].toString()),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
