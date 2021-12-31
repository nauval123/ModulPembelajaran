import 'package:flutter/material.dart';

import 'package:modul_pembelajaran_kimia/model/Question.dart';

class CustomCardWidget extends StatelessWidget {
late final String judulcard;
late final String imagepath;
late final String deskripsi;

// final String imagepaths ='assets/Image/Bab2.jpg' ;

CustomCardWidget(
  this.judulcard,
  this.deskripsi,
  // this.imagepath
);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(judulcard);
        Navigator.of(context).pushNamed('/'+judulcard);
      },
      child: Card(
            color: Colors.blue[800],
            shadowColor: Colors.blueGrey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 10,
            child:
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade800,
                      Colors.blue.shade500,
                      Colors.blue.shade400,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.only(top:10,left:10,right: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_outline_rounded,size: 30,color: Colors.blue[50],),
                        Text(
                          this.judulcard,
                          style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                        ),
                        Text(
                          this.deskripsi,
                          style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                          fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          fit: BoxFit.fill,
                          image:  AssetImage("assets/logo/icons/$judulcard.png")
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
      );
  }
}

class CustomCardQuizResultWidget extends StatelessWidget {
  final Question questionpack;
  final String useranswer;
  final int indexquestion;
  final int questionlenght;
  
  const CustomCardQuizResultWidget({
    required  this.questionpack,
    required this.useranswer,
    required this.indexquestion,
    required this.questionlenght,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width/1.2,
            height: MediaQuery.of(context).size.height/2,
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                // Spacer(flex: 1,),
                Flexible(
                  flex: 4,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('soal ke '+indexquestion.toString()+" dari "+questionlenght.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                        Text(questionpack.question,style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Placeholder(),
                ),
                // Spacer(),
                Flexible(
                  flex: 4,
                  child: Container(
                    child: ListView.builder(
                      itemCount:4,
                      itemBuilder:( context, index){
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: questionpack.answer[index].score == true ?
                            Colors.green[300]:Colors.red[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(questionpack.answer[index].choices+". "
                            +questionpack.answer[index].answertext
                            +(questionpack.answer[index].choices== useranswer?"  "+"V":""),
                            ),
                          )
                        );
                      }
                      ),
                  ),
                  // Placeholder()
                ),
              ],
            ),
          );
  }
}
