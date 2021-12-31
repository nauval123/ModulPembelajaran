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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        children: [
                         Text('Hello',style: TextStyle(color: Colors.grey[300],fontSize:10),),
                          Text(this._usernamedata.isNotEmpty?this._usernamedata:"anonymous",style: TextStyle(color:Colors.white,fontSize:30),),
                       ],
                      ),
                    SizedBox(width: MediaQuery.of(context).size.width/2,),
                    Icon(Icons.person_pin,color: Colors.white,size: 70,)
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/7,
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height/60,),
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
            ],
          ),
          ),
      ),
      // )
    );
  }
}
