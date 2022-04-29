import 'package:authentication/ui/screens/auth/login/login.dart';
import 'package:authentication/ui/screens/auth/register/register.dart';
import 'package:authentication/ui/screens/home/home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget widget = Container();

    switch (settings.name) {
      case HomeScreen.route:
        widget = HomeScreen();
        break;

      case LoginScreen.route:
        widget = LoginScreen();
        break;

      case RegisterScreen.route:
        widget = RegisterScreen();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
