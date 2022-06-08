import 'package:clean_arch_chat/features/chatroom/data/datasources/firebase_remote_datasource.dart';

import '../../domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});
  @override
  Future<String> getCurrentUid() async =>
      await firebaseRemoteDataSource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => await firebaseRemoteDataSource.isSignIn();

  @override
  Future<void> signIn(String email, String password) async =>
      await firebaseRemoteDataSource.signIn(email, password);

  @override
  Future<void> signUp(String email, String password) async =>
      await firebaseRemoteDataSource.signUp(email, password);

  @override
  Future<void> getCreateCurrentUser(
      String email, String name, String profileUrl, String uid) async {
    return await firebaseRemoteDataSource.getCreateCurrentUser(
        email, name, profileUrl, uid);
  }
}
