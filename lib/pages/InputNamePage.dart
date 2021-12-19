import 'package:flutter/material.dart';
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
      backgroundColor: Colors.blue[100],
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
            Flexible(
              flex:4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                    ),
                ),
                child: Column(
                  children: [
                    Spacer(flex: 1,),
                    Flexible(
                      flex: 1,
                      child: Text(
                          'Siap Untuk Belajar?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            ),
                          ),
                    ),
                    Spacer(),
                     Flexible(
                       flex: 3,
                       child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Image.asset('assets/logo/inputnamelogo.png',scale:1.5),
                        ),
                     ),
                     Spacer(),
                    //   Flexible(
                    //   flex: 1,
                    //   child: Text(
                    //       'Yuk Masukkan Nama untuk Mulai !',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontSize: 15,
                    //         color: Colors.white,
                    //         ),
                    //       ),
                    // ),
                     Flexible(
                       flex: 2,
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
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(25),
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
                                color: Colors.black54,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                                hintText: "Masukkan Nama Kamu",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    )
                  ],
                ),
              )
              ),
            Flexible(
              flex: 1,
              child:
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
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.blue[300]
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
                      onPressed: () async {
                        // print('simpan'+usernameController.text);
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('username', usernameController.text);
                        Navigator.of(context).pushReplacementNamed('/Dashboard');
                        // final datausername = prefs.getString('username');
                        // print(datausername);
                      },
                    ),
              )
                )
              ],
            ),
          ),
        )
        )
      );
  }
}