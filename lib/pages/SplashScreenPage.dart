import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  checkusername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String statuslogin = prefs.getString('username') ?? '';
    var timer = const Duration(seconds: 1);
    return Timer(timer, () {
      statuslogin.isEmpty
          ? Navigator.pushReplacementNamed(context, '/onboarding')
          // : Navigator.pushReplacementNamed(context, '/arflutter');
          : Navigator.pushReplacementNamed(context, '/Dashboard');
    });
  }

  @override
  void initState() {
    super.initState();
    checkusername();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/Image/cover.png')),
          ),
        ),
      ),
    );
  }
}
