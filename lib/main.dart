import 'package:flutter/material.dart';

import 'features/chatroom/presentation/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Responsive Chat room',
      home: HomeScreen()
    );
  }
}