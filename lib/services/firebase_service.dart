import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

const String userCollection = 'users';
const String postsCollection = 'posts';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Map<String, dynamic>? _currentUser;

  Map<String, dynamic>? get currentUser => _currentUser;

  Future<String?> registerUser({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = userCredential.user!.uid;
      final fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      final task = _storage.ref('images/$userId/$fileName').putFile(image);
      return await task.then((snapshot) async {
        final downloadURL = await snapshot.ref.getDownloadURL();
        await _db.collection(userCollection).doc(userId).set({
          'name': name,
          'email': email,
          'image': downloadURL,
        });
        return null;
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on Exception {
      return 'Failed to register user.';
    }
  }

  Future<Map<String, dynamic>> getUserData({required String uid}) async {
    final doc = await _db.collection(userCollection).doc(uid).get();
    return doc.data()!;
  }

  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = await getUserData(uid: userCredential.user!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on Exception {
      return 'Failed to log in.';
    }
  }

  Future<String?> postImage(File image) async {
    try {
      final userId = _auth.currentUser!.uid;
      final fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      final task = _storage.ref('images/$userId/$fileName').putFile(image);
      return await task.then((snapshot) async {
        final downloadUrl = await snapshot.ref.getDownloadURL();
        await _db.collection(postsCollection).add({
          'userId': userId,
          'timestamp': Timestamp.now(),
          'image': downloadUrl,
        });
        return null;
      });
    } on Exception {
      return 'Failed to post the image.';
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getLatestPosts() {
    return _db
        .collection(postsCollection)
        .orderBy(
          'timestamp',
          descending: true,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsForUser() {
    final userId = _auth.currentUser!.uid;
    return _db
        .collection(postsCollection)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
