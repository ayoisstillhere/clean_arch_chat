import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../data/models/user_model.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/login/login_cubit.dart';
import '../../bloc/user/user_cubit.dart';
import '../../screens/single_chat_screen.dart';

class WelcomePageMobile extends StatefulWidget {
  final String uid;
  const WelcomePageMobile({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<WelcomePageMobile> createState() => _WelcomePageMobileState();
}

class _WelcomePageMobileState extends State<WelcomePageMobile> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserLoaded) {
          return _bodyWidget(state);
        }
        return _loadingWidget();
      },
    );
  }

  Scaffold _bodyWidget(UserLoaded users) {
    final user = users.users.firstWhere((user) => user.uid == widget.uid,
        orElse: () => UserModel(name: "", email: "", uid: "", profileUrl: ""));
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
            )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.asset("assets/congratulation.json"),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset("assets/bubble.json"),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  "Welcome ${user.name}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          _joinGlobalChatButton(user.name),
          _logOutWidget(),
        ],
      ),
    );
  }

  Scaffold _loadingWidget() {
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
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _joinGlobalChatButton(String name) {
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
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SingleChatScreen(
                    userName: name,
                    uid: widget.uid,
                  ),
                ),
              );
            },
            child: Container(
              width: 180,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white60, width: 2)),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logOutWidget() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: () {
          BlocProvider.of<AuthCubit>(context).loggedOut();
          BlocProvider.of<LoginCubit>(context).submitSignOut();
        },
        child: Container(
          margin: EdgeInsets.only(left: 15, bottom: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.exit_to_app,
            size: 30,
          ),
        ),
      ),
    );
  }
}
