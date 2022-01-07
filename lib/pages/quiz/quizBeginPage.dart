import 'package:flutter/material.dart';

class QuizBegin extends StatelessWidget {
  const QuizBegin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                      width: MediaQuery.of(context).size.width/(MediaQuery.of(context).orientation == Orientation.portrait?3:5),
                      height: MediaQuery.of(context).size.height/(MediaQuery.of(context).orientation == Orientation.portrait?5:3),
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          fit: BoxFit.fill,
                          image:  AssetImage("assets/logo/icons/Quiz.png")
                        )
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                     "Quiz",
                      style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25,),
                    Text(
                      "Setelah kamu membaca materi yuk coba uji pengetahuanmu !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "mulai",
                            style: TextStyle(
                              color: Colors.blue[300],
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            )
                          ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/QuizStart');
                      },
                    ),
                ],
              ),
            ),
          ),
          ),
    );
  }
}