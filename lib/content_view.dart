import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'widgets/custom_tab.dart';

class ContentView{
  ContentView({@required this.tab, @required this.content});

  final CustomTab tab;
  final Widget content;
}
