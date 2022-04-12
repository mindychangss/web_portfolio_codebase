import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common.dart';

class CustomTab extends StatelessWidget {
  CustomTab({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        this.title,
        style: TextStyle(fontSize: 16.0,color: CommonColors.primary),
      ),
    );
  }
}
