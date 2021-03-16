import 'package:flutter/material.dart';
import 'package:rasan/logic/auth/auth_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSearchBar = false;
  ScrollController scrollController = ScrollController();
  double _scrollPosition;
  AuthController authController = UserAuthController();

  @override
  void initState() {
    // productContainer = productContainerdata;
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      _scrollPosition = scrollController.position.pixels;

      if (_scrollPosition > 75) {
        _showSearchBar = true;
      } else {
        _showSearchBar = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rasan Mart'),
        actions: [
          GestureDetector(
              onTap: () {
                authController.signOut();
                Navigator.of(context).pushReplacementNamed('auth');
              },
              child: Icon(Icons.power))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(child: Text('Here is data')),
      ),
    );
  }
}
