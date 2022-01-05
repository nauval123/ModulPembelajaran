import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/common/widgetcustom.dart';
import 'package:modul_pembelajaran_kimia/model/Question.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class QuizResult extends StatefulWidget {

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  // late String _username;
  late List _result;
  late int  _score = 0;
  // late int _falsescore=0;
  late List <Question> _questionpacks = <Question>[] ;
  

  void _loadQuestions() async{
    var json = await DefaultAssetBundle.of(context).loadString('assets/quiz.json');
    var _question = parsingDataQuiz(json);
    var result = ModalRoute.of(context)!.settings.arguments as List;
    var scores=  _checkScore(_question,result);
    setState(() {
      _questionpacks = _question;
      _result =   result;
      _score = scores[0];
      // _falsescore = scores[1];
    });
    
  }

  //  void getUsername() async{
  //    final SharedPreferences prefs = await SharedPreferences.getInstance();
  //    final String nama = prefs.getString('username')??"Anonymous";
  //   setState(() {
  //     // _username=nama;
  //   });
  //  }

    _checkScore (List questionpacks,List result) {
     int scores = 0;
     int fscores=0;
    //  _questionpacks.map((question) => question.answer.asMap()
    //  .map((key, value) => MapEntry(key, value.choices == _result[key]?scores++:scores=scores+0)));
    //  return scores;
     for(var i = 0 ; i<= questionpacks.length-1 ; i++){
       for (var j = 0 ; j<= questionpacks[i].answer.length-1;j++){
         if(questionpacks[i].answer[j].choices == result[i] && questionpacks[i].answer[j].score == true){
           scores= scores+20;

           print(scores);
         }else{
           fscores=fscores+20;
         }
       }
      }
      List finalscore= [scores,fscores];
     return finalscore;
    
    }
   
  String delayScore (String text){
    var i;
    Timer(Duration(microseconds: 4000),(){
      i = text;
    });
    return i;
  }


   @override
  void initState() {
    _loadQuestions();
    // _checkScore();
    // getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade300,
        // appBar: AppBar(title: Text(_score.toString(),),),
        body: _questionpacks.isEmpty? 
          Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  scoreCircular (),
                  getCardResult(_questionpacks),
                ],
              )
              )
          ),
      ),
    );
  }

  Widget getCardResult(List <Question>questionpacks){
    List <Widget>  list  = <Widget>[];
    for(var i = 0 ; i  < questionpacks.length;i++){
      list.add( CustomCardQuizResultWidget(
        questionpack: questionpacks[i],
        indexquestion: i,
        questionlenght: questionpacks.length,
        useranswer: _result[i],
        ),
      );
      list.add(SizedBox(height: 10,width: 10,));
    }
    return Container(
      height: MediaQuery.of(context).size.height/(MediaQuery.of(context).orientation == Orientation.portrait? 3:2.5),
      child: new ListView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
         children: list,
        ),
    );
  }

    Widget scoreCircular(){
      final List <ChartData> chartData = [
        ChartData('betul',_score,Colors.lightGreen.shade300),
        // ChartData('salah', _falsescore,Colors.red.shade400)
      ];
      return Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
          SfCircularChart(
            // borderColor: Colors.red,
           series: <CircularSeries>[
                  RadialBarSeries<ChartData, String>(
                      trackColor: Colors.red.shade400,
                      maximumValue: 100,
                      animationDuration: 4000,
                      animationDelay: 150,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.title,
                      yValueMapper: (ChartData data, _) => data.data,
                      pointColorMapper: (ChartData data, _) => data.color ,
                      // Radius of the radial bar's inner circle
                      radius: '40%',
                      innerRadius: '70%',
                      cornerStyle: CornerStyle.bothCurve,
                      // animationDuration: 1,
                      gap:"10%",
                  )
              ]

          ),
          Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 4000),
              child: Text(
                _score.toString(),
                style: TextStyle(
                  fontSize:30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
        ],),
      );
    }
}

class ChartData {
  ChartData(this.title,this.data,[this.color= Colors.green]);
  final String title;
  final int data;
  final Color color;
}