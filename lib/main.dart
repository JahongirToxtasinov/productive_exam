import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_exam/firebase_options.dart';

import 'assets/constants/routes/app_routes.dart';
import 'assets/theme/theme.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/home/bloc/tab_bar_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) =>
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TabBarBloc(),
          ),
          BlocProvider(
            create: (context) => AuthenticatedBloc(),
          ),

        ],
      child : MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'productive_exam',
      theme: AppTheme.darkTheme(),
      navigatorKey: _navigatorKey,
      onGenerateRoute: AppRoute.onGenerateRoute,
    ),
      );

}

