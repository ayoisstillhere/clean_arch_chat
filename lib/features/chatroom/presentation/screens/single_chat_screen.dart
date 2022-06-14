import 'package:clean_arch_chat/features/chatroom/presentation/pages/mobile/single_chat_page_mobile.dart';
import 'package:clean_arch_chat/features/chatroom/presentation/pages/tablet/single_chat_page_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:clean_arch_chat/features/chatroom/presentation/pages/web/single_chat_page_web.dart';

class SingleChatScreen extends StatelessWidget {
  final String uid;
  final String userName;
  const SingleChatScreen({
    Key? key,
    required this.uid,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return SingleChatPageWeb(uid: uid, userName: userName);
        }
        if (sizingInformation.isTablet) {
          return SingleChatPageTablet(uid: uid, userName: userName);
        }
        return SingleChatPageMobile(uid: uid, userName: userName,);
      },
    );
  }
}
