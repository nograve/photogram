import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:photogram/pages/full_screen_page.dart';
import 'package:photogram/services/firebase_service.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final FirebaseService firebaseService = GetIt.instance.get<FirebaseService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: firebaseService.getLatestPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final posts = snapshot.data!.docs.map((e) => e.data()).toList();
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Column(
                children: [
                  GestureDetector(
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
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(post['image'].toString()),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Published by @${post['userId']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
