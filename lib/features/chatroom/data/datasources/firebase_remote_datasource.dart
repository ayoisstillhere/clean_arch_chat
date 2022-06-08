import 'package:clean_arch_chat/features/chatroom/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<bool> isSignIn();
  Future<String> getCurrentUid();
  Future<void> getCreateCurrentUser(
      String email, String name, String profileUrl, String uid);
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");
  @override
  Future<String> getCurrentUid() async => _auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => _auth.currentUser!.uid != null;

  @override
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> getCreateCurrentUser(
      String email, String name, String profileUrl, String uid) async {
    _userCollection.doc(_auth.currentUser!.uid).get().then((user) {
      if (!user.exists) {
        final newUser = UserModel(
          name: name,
          email: email,
          uid: uid,
          profileUrl: profileUrl,
        ).toDocument();
        _userCollection.doc(_auth.currentUser!.uid).set(newUser);
        return;
      } else {
        print("User Already Exists");
        return;
      }
    });
  }
}
