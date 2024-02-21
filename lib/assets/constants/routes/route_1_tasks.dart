import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../features/tasks/presentation/tasks_screen.dart';

class TasksRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const TasksScreen());
      // case TasksRouteNames.notes:
      //   return CupertinoPageRoute(builder: (context) => NotesScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}

