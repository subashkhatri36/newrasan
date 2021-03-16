import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/core/routes/app_routes.dart';
import 'package:rasan/core/theme/app_theme.dart';
import 'package:rasan/logic/bundles/controller_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      initialRoute: AppRoute.splash,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
    //vscode://vscode.github-authentication/did-authenticate?windowid=1&code=200781692d718dd9cdbd&state=148159a8-27b2-47c6-93a4-e38b6ce794d9
  }
}
