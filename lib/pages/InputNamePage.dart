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
              color: Colors.blue[300]
            ),
            child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset('assets/Image/Bab1.png'),
                )
              ),
            Flexible(
            flex: 3,
            child:  Text(
                'Belajar Makin Mudah',
                ),
            ),
            Flexible(
              flex: 5,
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
                      border: OutlineInputBorder(),
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
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent[200]
                    ),
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  //fungsi async lambda untuk add ke firestore
                  onPressed: () async {
                    print('simpan'+usernameController.text);
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('username', usernameController.text);
                    final datausername = prefs.getString('username');
                    print(datausername);
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