import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async => await repository.isSignIn();
}
