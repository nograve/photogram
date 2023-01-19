import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/firebase_service.dart';

class PostsGridView extends StatelessWidget {
  PostsGridView({super.key});

  final FirebaseService firebaseService = GetIt.instance.get<FirebaseService>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: firebaseService.getPostsForUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List posts =
                snapshot.data!.docs.map((e) => e.data()).toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final Map post = posts[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(post['image']),
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
