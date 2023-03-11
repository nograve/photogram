import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/firebase_service.dart';

class UserNameWidget extends StatelessWidget {
  UserNameWidget({super.key});

  final FirebaseService firebaseService = GetIt.instance.get<FirebaseService>();

  @override
  Widget build(BuildContext context) {
    return Text(
      firebaseService.currentUser!['name'],
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
