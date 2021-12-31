import 'dart:convert';

class Question{
  late String question;
  late List<Answer> answer;


  Question({
    required this.question,
    required this.answer,
  });

  Question.fromJson(Map<String,dynamic> questionpack){
    question  = questionpack['question'];
    var listanswer=  questionpack['answers'] as List;
    List <Answer>listanswers= listanswer.map((e) => Answer.fromJson(e)).toList();
    answer = listanswers;
  }

}

List<Question> parsingDataQuiz(String? json){
    if (json == null) {
  return [];
}
  Map <String,dynamic> map = jsonDecode(json);
  final List parsed = map['Quiz'];
  return parsed.map((json) => Question.fromJson(json)).toList();
}

class Answer{
  late String choices;
  late String answertext;
  late bool score;

  Answer({
    required this.choices,
    required this.answertext,
    required this.score,
  });

  Answer.fromJson(Map <String,dynamic> json){
    choices= json["choices"];
    answertext = json['answerText'];
    score = json['score'];
  }

}