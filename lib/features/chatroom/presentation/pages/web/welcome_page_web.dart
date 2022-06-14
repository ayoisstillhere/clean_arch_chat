import 'package:clean_arch_chat/features/chatroom/data/models/user_model.dart';
import 'package:clean_arch_chat/features/chatroom/presentation/pages/web/single_chat_page_web.dart';
import 'package:clean_arch_chat/features/chatroom/presentation/screens/single_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:clean_arch_chat/features/chatroom/presentation/bloc/user/user_cubit.dart';

class WelcomePageWeb extends StatefulWidget {
  final String uid;
  const WelcomePageWeb({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<WelcomePageWeb> createState() => _WelcomePageWebState();
}

class _WelcomePageWebState extends State<WelcomePageWeb> {
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

  Widget _bodyWidget(UserLoaded users) {
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
              margin: EdgeInsets.only(top: 150),
              child: Text(
                "Welcome ${user.name}",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _joinGlobalChatButton(name: user.name),
          _logOutWidget(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 380,
              width: 380,
              child: Lottie.asset("bubble.json"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingWidget() {
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

  Widget _joinGlobalChatButton({required String name}) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Join Us For Fun",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
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
              width: 250,
              height: 70,
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
                style: TextStyle(fontSize: 30),
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
          //TODO: logout
          print("logout");
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
