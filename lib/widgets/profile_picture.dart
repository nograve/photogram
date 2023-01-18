import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/firebase_service.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({super.key});

  final FirebaseService firebaseService = GetIt.instance.get<FirebaseService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(firebaseService.currentUser!['image']),
        ),
      ),
    );
  }
}
