import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/expense/presentation/expense_screen.dart';

class ExpenseRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const ExpenseScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}

