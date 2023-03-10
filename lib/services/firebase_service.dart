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
  Map? _currentUser;

  Map? get currentUser => _currentUser;

  Future<String?> registerUser({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final String userId = userCredential.user!.uid;
      final String fileName =
          Timestamp.now().millisecondsSinceEpoch.toString() +
              p.extension(image.path);
      final UploadTask task =
          _storage.ref('images/$userId/$fileName').putFile(image);
      return await task.then((snapshot) async {
        final String downloadURL = await snapshot.ref.getDownloadURL();
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

  Future<Map> getUserData({required String uid}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _db.collection(userCollection).doc(uid).get();
    return doc.data() as Map;
  }

  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
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
      final String userId = _auth.currentUser!.uid;
      final String fileName =
          Timestamp.now().millisecondsSinceEpoch.toString() +
              p.extension(image.path);
      final UploadTask task =
          _storage.ref('images/$userId/$fileName').putFile(image);
      return await task.then((snapshot) async {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
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

  Stream<QuerySnapshot> getLatestPosts() {
    return _db
        .collection(postsCollection)
        .orderBy(
          'timestamp',
          descending: true,
        )
        .snapshots();
  }

  Stream<QuerySnapshot> getPostsForUser() {
    final String userId = _auth.currentUser!.uid;
    return _db
        .collection(postsCollection)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
