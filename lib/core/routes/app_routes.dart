import 'package:flutter/material.dart';
import 'package:rasan/core/exception/failure.dart';
import 'package:rasan/presentation/Pages/HomePage/home_page.dart';
import 'package:rasan/presentation/Pages/SplashPage/splash_page.dart';
import 'package:rasan/presentation/Pages/authpage/auth_page.dart';

class AppRoute {
  static const String splash = '/';
  static const String home = '/home';
  static const String auth = 'auth';
  const AppRoute._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
        break;
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case auth:
        return MaterialPageRoute(builder: (_) => AuthenticatePage());
        break;
      default:
        throw RouteNotFound(message: '404 Not Found !');
    }
  }
}
