import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../data/models/user_model.dart';
import '../../bloc/user/user_cubit.dart';

class WelcomePageTablet extends StatefulWidget {
  final String uid;
  const WelcomePageTablet({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<WelcomePageTablet> createState() => _WelcomePageTabletState();
}

class _WelcomePageTabletState extends State<WelcomePageTablet> {
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
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "Welcome ${user.name}",
                style: TextStyle(
                  fontSize: 25,
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

  Widget _joinGlobalChatButton() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Join Us For Fun",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
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
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
