// @dart=2.9
import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/3dmodellist.dart';
import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/3DModelAtom.dart';
import 'package:modul_pembelajaran_kimia/pages/3dmodelpage/ar.dart';
import 'package:modul_pembelajaran_kimia/pages/DashboardPage.dart';
import 'package:modul_pembelajaran_kimia/pages/InputNamePage.dart';
import 'package:modul_pembelajaran_kimia/pages/LyricPage.dart';
import 'package:modul_pembelajaran_kimia/pages/MateriPage.dart';
import 'package:modul_pembelajaran_kimia/pages/PetaKonsep.dart';
import 'package:modul_pembelajaran_kimia/pages/TujuanPembelajaranPage.dart';
import 'package:modul_pembelajaran_kimia/pages/onboarding_page.dart';
import 'package:modul_pembelajaran_kimia/pages/quiz/QuizPage.dart';
import 'package:modul_pembelajaran_kimia/pages/SplashScreenPage.dart';
import 'package:modul_pembelajaran_kimia/pages/quiz/QuizBeginPage.dart';
import 'package:modul_pembelajaran_kimia/pages/quiz/QuizResultPage.dart';

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
      theme: ThemeData(fontFamily: 'QuickSand'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashScreen(),
        '/onboarding': (context) => OnBoardingPage(),
        '/Dashboard': (context) => Dashboard(),
        '/InputName': (context) => InputName(),
        '/Kuis': (context) => QuizBegin(),
        '/QuizStart': (context) => Quiz(),
        '/QuizResult': (context) => QuizResult(),
        '/AR & Bentuk 3D molekul': (context) => ModelList(),
        '/moleculemodel': (context) => ModelAtomPage(),
        // '/ar': (context) => ARPage(),
        '/ar': (context) => LocalAndWebObjectsWidget(),
        // '/arflutter': (context) => ArMarker(),
        '/Tujuan Pembelajaran': (context) => TujuanPembelajaranPage(),
        '/Materi': (context) => Materi(),
        '/Peta Konsep': (context) => PetaKonsepPage(),
        '/Lirik': (context) => LirikPage(),
      },
    );
  }
}
