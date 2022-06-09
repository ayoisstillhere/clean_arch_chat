import 'package:clean_arch_chat/features/chatroom/domain/entities/user_entity.dart';
import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class GetUsersUsecase {
  final FirebaseRepository repository;

  GetUsersUsecase({required this.repository});

  Stream<List<UserEntity>> call() => repository.getUsers();
}
