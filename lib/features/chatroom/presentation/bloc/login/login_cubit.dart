import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_chat/features/chatroom/domain/usecases/get_create_current_user.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/signin_usecase.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/signup_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final GetCreateCurrentUser getCreateCurrentUser;
  LoginCubit({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.getCreateCurrentUser,
  }) : super(LoginInitial());

  Future<void> submitLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      signInUseCase.call(email, password);
      emit(LoginSuccess());
    } on SocketException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure("Firebase exception"));
    }
  }

  Future<void> submitRegistration(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      signUpUseCase.call(email, password);
      emit(LoginSuccess());
    } on SocketException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure("Firebase exception"));
    }
  }
}
