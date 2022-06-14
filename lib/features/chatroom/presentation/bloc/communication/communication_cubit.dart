import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/text_message_entity.dart';
import '../../../domain/usecases/get_messages_usecase.dart';
import '../../../domain/usecases/send_text_message_usecase.dart';

part 'communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  final GetMessagesUsecase getMessagesUseCase;
  final SendTextMessageUseCase sendTextMessageUseCase;
  CommunicationCubit({
    required this.getMessagesUseCase,
    required this.sendTextMessageUseCase,
  }) : super(CommunicationInitial());

  Future<void> sendTextMsg({required TextMessageEntity textMessage}) async {
    try {
      await sendTextMessageUseCase.call(textMessage);
    } on SocketException catch (_) {}
  }

  Future<void> getTextMessages() async {
    try {
      final messages = getMessagesUseCase.call();
      messages.listen((msg) {
        emit(CommunicationLoaded(messages: msg));
      });
    } on SocketException catch (_) {}
  }
}
