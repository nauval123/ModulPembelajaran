// @dart=2.9
import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/3dmodellist.dart';
import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/3DModelAtom.dart';
import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/ar.dart';
// import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/ar.dart';
// import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/aranchor.dart';
// import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/testar.dart';
import 'package:modul_pembelajaran_kimia/pages/DashboardPage.dart';
import 'package:modul_pembelajaran_kimia/pages/InputNamePage.dart';
import 'package:modul_pembelajaran_kimia/pages/quiz/QuizPage.dart';
import 'package:modul_pembelajaran_kimia/pages/SplashScreenPage.dart';
import 'package:modul_pembelajaran_kimia/pages/quiz/QuizBeginPage.dart';
import 'package:modul_pembelajaran_kimia/pages/quiz/QuizResultPage.dart';
// import  'package:modul_pembelajaran_kimia/pages/3dmodelpage/testar.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      fontFamily: 'QuickSand'),
      debugShowCheckedModeBanner: true,
      // theme: ThemeData(textTheme: textTheme),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen':(context)=>SplashScreen(),
        '/Dashboard':(context)=>Dashboard(),
        '/InputName':(context)=>InputName(),
        '/Quiz':(context)=>QuizBegin(),
        '/QuizStart':(context)=>Quiz(),
        '/QuizResult':(context)=>QuizResult(),
        '/3D Model Atom':(context)=>ModelList(),
        '/moleculemodel':(context)=>ModelAtomPage(),
        // '/ar':(context)=>ARPage(),
        '/arflutter':(context)=>LocalAndWebObjectsWidget(),
      },
    );
  }
}
