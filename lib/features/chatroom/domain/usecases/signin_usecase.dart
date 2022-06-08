import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
