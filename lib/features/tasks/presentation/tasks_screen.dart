import 'package:flutter/material.dart';

import '../../../assets/constants/routes_name/app_routes.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){

            // Navigator.of(context).popUntil((route) => false);
            Navigator.of(context).pushNamedAndRemoveUntil(AppRouteNames.splash, (route) => true);
          },
      child: const Icon(Icons.remove),),

      body: const Center(
        child: Text("Tasks",style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
