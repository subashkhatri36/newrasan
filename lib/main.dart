import 'package:flutter/material.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/core/routes/app_routes.dart';
import 'package:rasan/core/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      initialRoute: AppRoute.auth,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
