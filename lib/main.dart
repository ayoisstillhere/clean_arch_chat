import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/chatroom/presentation/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture Responsive Chat room',
      home: HomeScreen(),
    );
  }
}
