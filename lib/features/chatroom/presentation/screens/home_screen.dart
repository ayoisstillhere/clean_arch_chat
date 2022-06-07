import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../pages/mobile/mobile_page.dart';
import '../pages/tablet/tablet_page.dart';
import '../pages/web/web_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return WebPage();
        }
        if (sizingInformation.isTablet) {
          return TabletPage();
        }
        return MobilePage();
      },
    );
  }
}
