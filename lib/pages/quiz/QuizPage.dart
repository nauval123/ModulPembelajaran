import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/model/Question.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late List <Question> _questionpacks = <Question>[] ;
  int _indexquestion = 0; 
  int _number=1;
  late List answerlist=[];
  


  void _loadQuestions() async{
    var json = await DefaultAssetBundle.of(context).loadString('assets/quiz.json');
    setState(() {
      _questionpacks = parsingDataQuiz(json);
    });
  }

  @override
  void initState() {
    _loadQuestions();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[300],
          body: _questionpacks.isEmpty? 
          Center(child: CircularProgressIndicator())
          :Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Spacer(flex: 1,),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('soal ke '+ (_number).toString()+" dari "+_questionpacks.length.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                        Text(_questionpacks[_indexquestion].question,style: TextStyle(
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
                Spacer(),
                Flexible(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    child: ListView.builder(
                      itemCount:4,
                      itemBuilder:( context, index){
                        return InkWell(
                          onTap: () {
                            print("panjang soal:"+_questionpacks.length.toString());
                            print("index ke sebelum:"+_indexquestion.toString());
                            if(_indexquestion == _questionpacks.length-1){
                              print('mentok!');
                              setState(() {
                                answerlist.add(_questionpacks[_indexquestion].answer[index].choices);
                              });
                              Navigator.of(context).pushNamed('/QuizResult',arguments: answerlist);
                            }else{
                              if(_indexquestion != _questionpacks.length){
                                setState(() {
                                  //  answerlist.add(index);
                                  answerlist.add(_questionpacks[_indexquestion].answer[index].choices);
                                _indexquestion++;
                                _number++;
                                  });
                              }
                            }
                            print(answerlist);
                            print("index ke sesudah:"+_indexquestion.toString()); 
                          },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height/10,
                          // width: MediaQuery.of(context).size.width/10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(_questionpacks[_indexquestion].answer[index].choices+". "+_questionpacks[_indexquestion].answer[index].answertext),
                          )
                        ),
                       );
                      }
                      ),
                  ),
                  // Placeholder()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}