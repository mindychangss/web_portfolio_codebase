import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({@required this.controller, @required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.21
        : screenWidth > 1100
            ? 0.3
            : 0.4;
    return Container(
      width: screenWidth * tabBarScaling,
      child: Theme(
        data: ThemeData(),
        child: TabBar(
          tabs: tabs,
          controller: controller,
          indicatorColor: CommonColors.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
    );
  }
}
