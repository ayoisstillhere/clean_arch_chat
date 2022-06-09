import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePageMobile extends StatelessWidget {
  const WelcomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo[400]!,
                  Colors.blue[300]!,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.asset(
              "congratulation.json",
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 80),
              child: Text(
                "Welcome XYZName",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _joinGlobalChatButton(),
        ],
      ),
    );
  }

  Widget _joinGlobalChatButton() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Join Us For Fun",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 180,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.white60,
                width: 2,
              ),
            ),
            child: Text(
              "Join",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
