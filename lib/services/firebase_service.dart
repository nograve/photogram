import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

const String userCollection = 'users';
const String postsCollection = 'posts';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Map? _currentUser;

  FirebaseService();

  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        _currentUser = await getUserData(uid: userCredential.user!.uid);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map> getUserData({required String uid}) async {
    final doc = await _db.collection(userCollection).doc(uid).get();
    return doc.data() as Map;
  }

  Future<bool> postImage(File image) async {
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
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }
}
