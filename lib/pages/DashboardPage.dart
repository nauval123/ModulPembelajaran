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
        // appBar: AppBar(actions: [IconButton(
        //   onPressed: (){Navigator.of(context).pushNamed('/ar');}, icon: Icon(Icons.ac_unit))],),
        extendBodyBehindAppBar: true,
        body:DashboardBody(_usernamedata),
        backgroundColor: Colors.blue[300],
      );}else{
        return CircularProgressIndicator();
      }
    }
   );
  }
}





class DashboardBody extends StatelessWidget {
  late final String _usernamedata;
 
  DashboardBody(
    this._usernamedata,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height/25),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FittedBox(
                     child: Text("Halo  " +(this._usernamedata.isNotEmpty?this._usernamedata:"anonymous"),style: TextStyle(color:Colors.white,fontSize:35),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  CustomCardWidget('Capaian Pembelajaran','Ketahui Tujuan Belajar'),
                  // SizedBox(height: MediaQuery.of(context).size.height/60,),
                  CustomCardWidget('Materi','Materi Ikatan Kimia'),
                  // SizedBox(height: MediaQuery.of(context).size.height/60,),
                  CustomCardWidget('Quiz','Uji Pengetahuanmu'),
                  // SizedBox(height: MediaQuery.of(context).size.height/60,),
                  CustomCardWidget('3D Model Atom','Bentuk Bentuk Atom?'),
                  // SizedBox(height: MediaQuery.of(context).size.height/60,),
                  // CustomCardWidget('Daftar Pustaka'),
                  // SizedBox(height: MediaQuery.of(context).size.height/50,),
                  // CustomCardWidget('Settings'),
                  ],
                ),
          ),
      ),
      // )
    );
  }
}
