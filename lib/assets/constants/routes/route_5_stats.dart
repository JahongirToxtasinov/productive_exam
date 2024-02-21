import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/stats/presentation/stats.dart';

class StatsRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const StatsScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}

