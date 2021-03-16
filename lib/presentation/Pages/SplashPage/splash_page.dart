import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/logic/firebase_controller.dart';
import 'package:rasan/presentation/Pages/HomePage/home_page.dart';
import 'package:rasan/presentation/Pages/authpage/auth_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashDelay = 2;
  String _versionName = 'V1.0';
  @override
  void initState() {
    _loadWidget();
    super.initState();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    print(Get.find<FirebaseInfo>().firebaseAuth.currentUser);
    //Get.find<FirebaseInfo>().userCredential?.user
    if (Get.find<FirebaseInfo>().firebaseAuth.currentUser != null)
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    else
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => AuthenticatePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.PNG',
                        height: 300,
                        width: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Spacer(),
                            Text(
                              _versionName,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Text(
                              Strings.appName,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
