import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BodyWidget extends StatefulWidget {
  final SizingInformation sizingInformation;
  const BodyWidget({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoginPage = true;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WELCOME TO ChatChat",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            """Hi, I’m Ayodele Fagbami. I’m a 19 year old software developer specialising in cross platform application development using flutter and firebase.""",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          SizedBox(height: 15),
          _imageWidget(),
          SizedBox(height: 15),
          _formWidget(),
          SizedBox(height: 15),
          _buttonWidget(),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.bottomCenter,
            child: _rowTextWidget(),
          ),
        ],
      ),
    );
  }

  Widget _imageWidget() {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset("assets/profile.png"),
    );
  }

  Widget _formWidget() {
    return Column(
      children: [
        isLoginPage
            ? const SizedBox(
                height: 0,
              )
            : Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.grey, width: 1.0)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "User Name",
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              ),
        isLoginPage
            ? const SizedBox(
                height: 0,
              )
            : SizedBox(height: 20),
        Container(
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(color: Colors.grey, width: 1.0)),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email Address",
              prefixIcon: Icon(Icons.alternate_email),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(color: Colors.grey, width: 1.0)),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: widget.sizingInformation.screenSize.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Text(
        isLoginPage ? "LOGIN" : "SIGN UP",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _rowTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginPage ? "Don't have account?" : "Have an account?",
          style: TextStyle(fontSize: 16, color: Colors.indigo[400]),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isLoginPage = !isLoginPage;
            });
          },
          child: Text(
            isLoginPage ? "Sign Up" : "Sign In",
            style: TextStyle(
                fontSize: 16,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
