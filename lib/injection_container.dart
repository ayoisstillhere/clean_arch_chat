import 'package:clean_arch_chat/features/chatroom/domain/usecases/send_text_message_usecase.dart';
import 'package:clean_arch_chat/features/chatroom/presentation/bloc/user/user_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/chatroom/data/datasources/firebase_remote_datasource.dart';
import 'features/chatroom/data/repositories/firebase_repository_impl.dart';
import 'features/chatroom/domain/repositories/firebase_repository.dart';
import 'features/chatroom/domain/usecases/get_create_current_user.dart';
import 'features/chatroom/domain/usecases/get_current_uid_usecase.dart';
import 'features/chatroom/domain/usecases/get_messages_usecase.dart';
import 'features/chatroom/domain/usecases/get_users_usecase.dart';
import 'features/chatroom/domain/usecases/is_signin_usecase.dart';
import 'features/chatroom/domain/usecases/signin_usecase.dart';
import 'features/chatroom/domain/usecases/signup_usecase.dart';
import 'features/chatroom/presentation/bloc/auth/auth_cubit.dart';
import 'features/chatroom/presentation/bloc/login/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features bloc,
  sl.registerFactory<AuthCubit>(() =>
      AuthCubit(isSignInUseCase: sl.call(), getCurrentUidUseCase: sl.call()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(
      signUpUseCase: sl.call(),
      signInUseCase: sl.call(),
      getCreateCurrentUser: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(usersUsecase: sl.call()));

  //!useCase
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUser>(
      () => GetCreateCurrentUser(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUsersUsecase>(
      () => GetUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetMessagesUsecase>(
      () => GetMessagesUsecase(repository: sl.call()));
  sl.registerLazySingleton<SendTextMessageUseCase>(
      () => SendTextMessageUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseRemoteDataSource: sl.call()));

  //dataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl());

  //external
  //e.g final sharedPreference = await SharedPreferences.getInstance();
}
