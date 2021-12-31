import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/common/widgetcustom.dart';
import 'package:modul_pembelajaran_kimia/model/Question.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizResult extends StatefulWidget {

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  late String _username;
  late List _result;
  late int  _score;
  late List <Question> _questionpacks = <Question>[] ;

  void _loadQuestions() async{
    var json = await DefaultAssetBundle.of(context).loadString('assets/quiz.json');
    setState(() {
      _questionpacks = parsingDataQuiz(json);
      _result =   ModalRoute.of(context)!.settings.arguments as List;
    });
  }

   void getUsername() async{
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     final String nama = prefs.getString('username')??"Anonymous";
    setState(() {
      _username=nama;
    });
   }

   void checkScore (){
     for(var i = 0 ; i<= _questionpacks.length-1 ; i++){
       for (var j = 0 ; j<_questionpacks[i].answer.length-1;j++){
         if(_questionpacks[i].answer[j]==_result[i]){
           setState(() {
             _score = _score +1;
           });
         }
       }
      }
    }
   

   @override
  void initState() {
    getUsername();
    _loadQuestions();
    checkScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade300,
        body: _questionpacks.isEmpty? 
          Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: getCardResult(_questionpacks)
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
      list.add(SizedBox(height: 10,));
    }
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: list,
      );
  }
}