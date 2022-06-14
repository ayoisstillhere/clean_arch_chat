import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch_chat/features/chatroom/domain/usecases/get_create_current_user.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/sign_out_usecase.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/signin_usecase.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/signup_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final GetCreateCurrentUser getCreateCurrentUser;
  final SignOutUseCase signOutUseCase;
  LoginCubit({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.getCreateCurrentUser,
    required this.signOutUseCase,
  }) : super(LoginInitial());

  Future<void> submitLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      await signInUseCase.call(email, password);
      emit(LoginSuccess());
    } on SocketException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure("Firebase exception"));
    }
  }

  Future<void> submitRegistration(
      {required String email,
      required String password,
      required String name}) async {
    emit(LoginLoading());
    try {
      await signUpUseCase.call(email, password);
      await getCreateCurrentUser.call(email, name, "");
      emit(LoginSuccess());
    } on SocketException catch (e) {
      emit(LoginFailure(e.message));
    } catch (_) {
      emit(LoginFailure("Firebase exception"));
    }
  }

  Future<void> submitSignOut() async {
    try {
      await signOutUseCase.call();
    } on SocketException catch (e) {
      
    }
  }
}
