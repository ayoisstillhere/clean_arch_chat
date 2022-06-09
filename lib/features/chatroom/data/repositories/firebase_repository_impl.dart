import 'package:clean_arch_chat/features/chatroom/data/datasources/firebase_remote_datasource.dart';
import 'package:clean_arch_chat/features/chatroom/domain/entities/user_entity.dart';
import 'package:clean_arch_chat/features/chatroom/domain/entities/text_message_entity.dart';

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
      String email, String name, String profileUrl) async {
    return await firebaseRemoteDataSource.getCreateCurrentUser(
        email, name, profileUrl,);
  }

  @override
  Stream<List<TextMessageEntity>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<void> sendTextMessage(TextMessageEntity textMessage) {
    // TODO: implement sendTextMessage
    throw UnimplementedError();
  }
}
