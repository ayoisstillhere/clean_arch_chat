import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(String email, String password) async {
    return repository.signUp(email, password);
  }
}
