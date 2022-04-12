import 'package:flutter/widgets.dart';
import '../common.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CommonColors.secondary,
    );
  }
}
