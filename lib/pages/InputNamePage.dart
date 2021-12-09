import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputName extends StatefulWidget {
  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
 final usernameKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white54
            ),
            child: Column(
          children: [
            Spacer(),
             Flexible(
            flex: 3,
            child:  Text(
                'Selamat Datang di Modul Kimia Asyik',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  ),
                ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset('assets/Image/Bab1.png'),
                )
              ),
            Flexible(
              flex: 4,
              child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: usernameKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
                 margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: Colors.blue[200],
                   borderRadius: BorderRadius.circular(10),
                 ),
                 width: MediaQuery.of(context).size.width/1.2,
                 child:TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.trim().length == 0) {
                        return "Nama Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    
                    controller:usernameController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "Masukkan Nama Kamu",
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                  // minWidth: MediaQuery.of(context).size.width/1.5,
                  // padding: EdgeInsets.all(10),
                  // color: Colors.blue[800],
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: Container( 
                    padding: EdgeInsets.all(25),
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.height/12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent[200]
                    ),
                    child: Center(
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  //fungsi async lambda untuk add ke firestore
                  onPressed: () async {
                    // print('simpan'+usernameController.text);
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('username', usernameController.text);
                    Navigator.of(context).pushReplacementNamed('/Dashboard');
                    // final datausername = prefs.getString('username');
                    // print(datausername);
                  },
                ),
                ),
              ],
            ),
          ),
              )
          ],
              ),
          ),
        )
        )
      );
  }
}