import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iyaloja/screens/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/11.png'))),
        ),
      ),
    );
  }
}
