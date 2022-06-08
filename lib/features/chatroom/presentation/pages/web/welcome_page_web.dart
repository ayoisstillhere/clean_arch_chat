import 'package:flutter/material.dart';

class WelcomePageWeb extends StatelessWidget {
  const WelcomePageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Welcome")
        ],
      ),
    );
  }
}
