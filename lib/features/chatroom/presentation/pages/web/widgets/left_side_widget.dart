import 'package:flutter/material.dart';
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
      color: Colors.blueGrey,
      width: sizingInformation.screenSize.width * 0.65,
      height: double.infinity,
    );
  }
}
