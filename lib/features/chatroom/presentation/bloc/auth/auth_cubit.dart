import 'package:bloc/bloc.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/get_current_uid_usecase.dart';
import 'package:clean_arch_chat/features/chatroom/domain/usecases/is_signin_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  AuthCubit({required this.isSignInUseCase, required this.getCurrentUidUseCase})
      : super(AuthInitial());

  Future<void> AppStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();
      if (isSignIn) {
        final currentUid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: currentUid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    final currentUid = await getCurrentUidUseCase.call();
    emit(Authenticated(uid: currentUid));
  }

  Future<void> loggedOut() async {
    emit(UnAuthenticated());
  }
}
