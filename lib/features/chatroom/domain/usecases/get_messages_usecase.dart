import 'package:clean_arch_chat/features/chatroom/domain/entities/text_message_entity.dart';
import 'package:clean_arch_chat/features/chatroom/domain/repositories/firebase_repository.dart';

class GetMessagesUsecase {
  final FirebaseRepository repository;

  GetMessagesUsecase({required this.repository});

  Stream<List<TextMessageEntity>> call()  => repository.getMessages();
}
