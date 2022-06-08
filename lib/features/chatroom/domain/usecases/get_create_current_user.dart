import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUser {
  final FirebaseRepository repository;

  GetCreateCurrentUser({required this.repository});

  Future<void> call(String email, String name, String profileUrl, String uid) async {
    repository.getCreateCurrentUser(
      email,
      name,
      profileUrl,
      uid,
    );
  }
}
