import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/calendar/presentation/calendar_screen.dart';

class CalendarRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const CalendarScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}

