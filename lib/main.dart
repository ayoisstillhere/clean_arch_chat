import 'package:clean_arch_chat/features/chatroom/presentation/bloc/login/login_cubit.dart';
import 'package:clean_arch_chat/features/chatroom/presentation/bloc/user/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/chatroom/presentation/bloc/auth/auth_cubit.dart';
import 'features/chatroom/presentation/screens/home_screen.dart';
import 'features/chatroom/presentation/screens/welcome_screen.dart';
import 'injection_container.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCvHMw7gvNo9qbaG3O7flGoIZnbCBhiP6M",
        appId: "1:1063131070191:web:66e1e522e7868ccb6d651a",
        messagingSenderId: "1063131070191",
        projectId: "cleanarchigroupchat",
        storageBucket: "cleanarchigroupchat.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..AppStarted(),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => di.sl<LoginCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Architecture Responsive Chat room',
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return WelcomeScreen(uid: authState.uid);
                }
                if (authState is UnAuthenticated) {
                  return HomeScreen();
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }
}
