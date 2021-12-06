import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/common/widgetcustom.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:modul_pembelajaran_kimia/pages/BabPage.dart';
import 'package:modul_pembelajaran_kimia/pages/MateriPage.dart';

import 'QuizPage.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String usernamedata;
  int _indexnavbar = 0;
  late  var _halamannavbar = [
    DashboardBody(),
    Materi(),
    Quiz(),
    Bab(),
  ];

  @override
  void initState() {
    super.initState();
    // _getusernamedata();
  }



// void _getusernamedata() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final String username = prefs.getString('username')??'';
//     setState(() {
//   //     _halamannavbar = [
//   //   DashboardBody(username),
//   //   Materi(),
//   //   Quiz(),
//   //   Bab(),
//   // ];
//     });
// }

// void _onTapNavbar(int index) {
//     setState(() {
//       _indexnavbar = index;
//     });
// }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton( onPressed:null, icon: Icon(Icons.list),),
      // ),
      backgroundColor: Colors.blueGrey[50],
      body:_halamannavbar[_indexnavbar],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _indexnavbar,
      //   onTap: _onTapNavbar,
      //   items: [
      //   BottomNavigationBarItem(label: "Materi",icon: Icon(Icons.library_books_rounded)),
      //   BottomNavigationBarItem(label: "Quiz",icon: Icon(Icons.question_answer)),
      //   BottomNavigationBarItem(label: "Tentang",icon: Icon(Icons.quiz_rounded)),
      //   ],
      //   ),
    );
  }
}





class DashboardBody extends StatelessWidget {
  // final String usernamedata;
 
  // DashboardBody(
  //   [this.usernamedata = 'anonymous']
  // );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width:  MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height/20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCardWidget('Capaian Pembelajaran'),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              CustomCardWidget('Materi'),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              CustomCardWidget('Quiz'),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              CustomCardWidget('3D Model Atom'),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              CustomCardWidget('Daftar Pustaka'),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              CustomCardWidget('Settings'),
              ],
            ),
          ),
      ),
      // )
    );
  }
}
