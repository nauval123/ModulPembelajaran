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
        Navigator.of(context).pushNamed('/' + judulcard);
      },
      child: Card(
        color: Colors.blue[800],
        shadowColor: Colors.blueGrey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 10,
        child: Container(
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
          padding: EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 30,
                    color: Colors.blue[50],
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      this.judulcard,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      this.deskripsi,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage("assets/logo/icons/$judulcard.png"))),
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
    required this.questionpack,
    required this.useranswer,
    required this.indexquestion,
    required this.questionlenght,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.width / 1.5
            : MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height / 4
            : MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
          gradient: LinearGradient(colors: [
            Colors.lightBlue.shade300,
            Colors.lightBlue.shade500,
            Colors.lightBlue.shade600,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            // Spacer(flex: 1,),
            Flexible(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'soal ke ' +
                            (indexquestion + 1).toString() +
                            " dari " +
                            questionlenght.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        questionpack.question,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Jawaban Kamu",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              // Placeholder(),
            ),
            // Spacer(),
            Flexible(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  children: questionpack.answer
                      .asMap()
                      .map((i, answer) => MapEntry(
                            i,
                            questionpack.answer[i].choices == useranswer
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Penjelasan'),
                                              content:
                                                  Text('Hey! I am Coflutter!'),
                                              backgroundColor:
                                                  Colors.lightBlue[300],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              actions: <Widget>[
                                                IconButton(
                                                    icon: new Icon(Icons.close),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    })
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                12,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        decoration: BoxDecoration(
                                          color: answer.score == true
                                              ? Colors.green[300]
                                              : Colors.red[300],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            answer.choices +
                                                ". " +
                                                answer.answertext +
                                                (questionpack.answer[i]
                                                            .choices ==
                                                        useranswer
                                                    ? "" + ""
                                                    : ""),
                                          ),
                                        )),
                                  )
                                : SizedBox(),
                          ))
                      .values
                      .toList(),
                ),
                // child: ListView.builder(
                //   itemCount:4,
                //   itemBuilder:( context, index){
                //     return Container(
                //       margin: EdgeInsets.all(10),
                //       height: MediaQuery.of(context).size.height/15,
                //       decoration: BoxDecoration(
                //         color: questionpack.answer[index].score == true ?
                //         Colors.green[300]:Colors.red[300],
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       child: Center(
                //         child: Text(questionpack.answer[index].choices+". "
                //         +questionpack.answer[index].answertext
                //         +(questionpack.answer[index].choices== useranswer?"  "+"V":""),
                //         ),
                //       )
                //     );
                //   }
                //   ),
              ),
              // Placeholder()
            ),
          ],
        ),
      ),
    );
  }

  List cardResult(Question questionpack, size) {
    List widget = [];
    for (var index = 0; index <= questionpack.answer.length; index++) {
      widget.add(
        Container(
            margin: EdgeInsets.all(10),
            height: size,
            decoration: BoxDecoration(
              color: questionpack.answer[index].score == true
                  ? Colors.green[300]
                  : Colors.red[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                questionpack.answer[index].choices +
                    ". " +
                    questionpack.answer[index].answertext +
                    (questionpack.answer[index].choices == useranswer
                        ? "  " + "V"
                        : ""),
              ),
            )),
      );
    }
    return widget;
  }
}
