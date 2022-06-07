import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeftSideWidget extends StatelessWidget {
  final SizingInformation sizingInformation;
  const LeftSideWidget({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizingInformation.screenSize.width * 0.65,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo[400]!,
            Colors.blue[300]!,
          ],
        ),
      ),
      child: Container(
        child: Stack(
          children: [
            _loginButton(),
            _bgImageWidget(),
            _welcomeTextWidget(),
            Positioned(
              left: -150,
              bottom: -150,
              child: Image.asset(
                "shape.png",
                color: Colors.white.withOpacity(.2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.white60,
            width: 1.50,
          ),
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 16, color: Colors.white60),
        ),
      ),
    );
  }

  _bgImageWidget() {
    return Align(alignment: Alignment.center, child: Lottie.asset("img.json"));
  }

  Widget _welcomeTextWidget() {
    return Positioned(
      left: 35,
      bottom: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WELCOME TO ChatChat",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            width: sizingInformation.screenSize.width * 0.60,
            child: Text(
              """Hi, I’m Ayodele Fagbami. I’m a 19 year old software developer specialising in cross platform application development using flutter and firebase.  I’m currently learning clean architecture implementation using flutter.""",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white60, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                color: Colors.white60,
                width: 1.50,
              ),
            ),
            child: Text(
              "SIGN IN",
              style: TextStyle(fontSize: 16, color: Colors.white60),
            ),
          ),
        ],
      ),
    );
  }
}
