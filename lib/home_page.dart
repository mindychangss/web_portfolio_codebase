import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'common.dart';
import 'utils/tab_controller_handler.dart';

import 'content_view.dart';
import 'views/about_view.dart';
import 'views/home_view.dart';
import 'views/projects_view.dart';
import 'widgets/custom_tab.dart';
import 'widgets/custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double screenHeight;
  double screenWidth;
  double topPadding;
  double bottomPadding;
  double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Home'),
      content: HomeView(),
    ),
    ContentView(
      tab: CustomTab(title: 'About'),
      content: AboutView(),
    ),
    ContentView(
      tab: CustomTab(title: 'Projects'),
      content: ProjectsView(),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.025;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');

    return Scaffold(
      backgroundColor: CommonColors.tabBar,
      key: scaffoldKey,
      body: Padding(
        // padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        padding: EdgeInsets.all(0),
        child: desktopView(),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //Tab Bar
        Container(
          height: screenHeight * 0.08,
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/logo100.svg',
                  width: screenHeight * 0.08,
                ),
                CustomTabBar(
                  controller: tabController,
                  tabs: contentViews.map((e) => e.tab).toList(),
                ),
              ],
            ),
          ),
        ),
        //Tab View
        Container(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
