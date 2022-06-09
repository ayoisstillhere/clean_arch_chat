import 'package:clean_arch_chat/features/chatroom/presentation/pages/mobile/widgets/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: BodyWidget(sizingInformation: sizingInformation),
            ),
          ),
        );
      },
    );
  }
}
