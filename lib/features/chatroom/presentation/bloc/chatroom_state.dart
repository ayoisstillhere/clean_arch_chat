part of 'chatroom_bloc.dart';

abstract class ChatroomState extends Equatable {
  const ChatroomState();  

  @override
  List<Object> get props => [];
}
class ChatroomInitial extends ChatroomState {}
