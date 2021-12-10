import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/common/widgetcustom.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:modul_pembelajaran_kimia/pages/BabPage.dart';
// import 'package:modul_pembelajaran_kimia/pages/MateriPage.dart';

// import 'QuizPage.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String _usernamedata;
  // int _indexnavbar = 0;
  // late  var _halamannavbar = [
  //   DashboardBody(),
  //   Materi(),
  //   Quiz(),
  //   Bab(),
  // ];


  Future<String> getUsername() async{
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     final String nama = prefs.getString('username')??"Anonymous";
     return nama;
   }

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
     future: getUsername(),
     builder: (context , snapshot)
      {
        if(snapshot.hasData){
          _usernamedata= snapshot.data.toString();
          return Scaffold(
        appBar: AppBar(
         title: Padding(
           padding: EdgeInsets.only(top: 10,left: 5,bottom: 10),
           child: Column(
             children: [
               Text('Hello',style: TextStyle(color: Colors.grey[300],fontSize: 15),),
               Text(this._usernamedata.isNotEmpty?this._usernamedata:"anonymous",style: TextStyle(color:Colors.white,fontSize: 20),),
             ],
           ),
         ),
         actions: [
           Padding(
             padding: EdgeInsets.only(top: 10,right: 20,bottom: 10),
             child: Container(child:Icon(Icons.person))
             )
             ],
          backgroundColor: Colors.blue[300],
          elevation: 0.0,
        ),
        // backgroundColor: Colors.blueGrey[50],
        extendBodyBehindAppBar: true,
        body:DashboardBody(),
        backgroundColor: Colors.blue[100],
        // _halamannavbar[_indexnavbar],
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _indexnavbar,
        //   onTap: _onTapNavbar,
        //   items: [
        //   BottomNavigationBarItem(label: "Materi",icon: Icon(Icons.library_books_rounded)),
        //   BottomNavigationBarItem(label: "Quiz",icon: Icon(Icons.question_answer)),
        //   BottomNavigationBarItem(label: "Tentang",icon: Icon(Icons.quiz_rounded)),
        //   ],
        //   ),
      );}else{
        return CircularProgressIndicator();
      }
    }
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 image: DecorationImage(
                   fit: BoxFit.fill,
                   image: AssetImage('assets/Image/Bab2.jpg')),
               ),
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" Yuk Mari Belajar!",style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  CustomCardWidget('Capaian Pembelajaran'),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  CustomCardWidget('Materi'),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  CustomCardWidget('Quiz'),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  CustomCardWidget('3D Model Atom'),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  CustomCardWidget('Daftar Pustaka'),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  CustomCardWidget('Settings'),
                  ],
                ),
            ],
          ),
          ),
      ),
      // )
    );
  }
}
