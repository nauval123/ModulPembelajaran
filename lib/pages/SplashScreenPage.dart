import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late String username;
  late AnimationController _controller;
  late Animation <double> _animation;

  void checkusername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String statuslogin = prefs.getString('username')??'';
    
    setState(() {
      username = statuslogin;
    });
    return;
  }

  @override
  void initState() { 
     _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    _animation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(_controller);
    super.initState();
    checkusername();
    beginSplash();
  }

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


   beginSplash () async {
    var duration = const Duration(seconds: 4);
    // _fade=!_fade;
    return Timer(duration, (){
    setState(() {
      // print(username);
    username.isEmpty ?
           Navigator.pushReplacementNamed(context, '/InputName')
           : Navigator.pushReplacementNamed(context, '/Dashboard');
        });
    });
  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:FadeTransition(
           opacity: _animation,
           child: Container(
             decoration: BoxDecoration(
               color: Colors.blue[800]),
               ),
          //  child: Image.asset(),
         ) ,),
    );
  }
}