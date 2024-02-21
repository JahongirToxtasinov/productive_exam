import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive_exam/features/authentication/presentation/login_screen.dart';
import 'package:productive_exam/features/home/home_page.dart';

import '../../../features/authentication/presentation/pages/signup_screen.dart';
import '../routes_name/app_routes.dart';


class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
      // case AppRouteNames.splash:
      //   return CupertinoPageRoute(builder: (context) => SplashScreen());
      case AppRouteNames.home:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case AppRouteNames.signUp:
        return CupertinoPageRoute(builder: (context) => SignUpScreen());
      // case AppRouteNames.login:
      //   return CupertinoPageRoute(builder: (context) => const LoginScreen());
      // case AppRouteNames.auth:
      //   return CupertinoPageRoute(builder: (context) => OnBoarding());
      default:
        return CupertinoPageRoute(builder: (context) => Scaffold());
    }
  }
}

