import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive_exam/features/create/presentation/create_screen.dart';

class CreateRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const CreateScreen());
      // case CreateRouteNames.notes:
      //   return CupertinoPageRoute(builder: (context) => CreateNotesScreen());
      // case CreateRouteNames.income:
      //   return CupertinoPageRoute(builder: (context) => CreateIncomeScreen());
      // case CreateRouteNames.expense:
      //   return CupertinoPageRoute(builder: (context) => CreateExpenseScreen());
      // case CreateRouteNames.tasks:
      //   return CupertinoPageRoute(builder: (context) => CreateTasksScreen());
      // case CreateRouteNames.event:
      //   return CupertinoPageRoute(builder: (context) => CreateEventScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}

