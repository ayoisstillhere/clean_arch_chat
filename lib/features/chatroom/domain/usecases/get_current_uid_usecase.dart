import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class GetCurrentUidUseCase {
  final FirebaseRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async => await repository.getCurrentUid();
}
