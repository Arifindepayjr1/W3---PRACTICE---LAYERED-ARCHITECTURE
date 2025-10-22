import 'package:test/test.dart';
import "../lib/domain/quiz.dart";
import "package:uuid/uuid.dart";
var uuid = new Uuid();

List<Question> questions = [
    Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris", 
        score: 10,
        id: uuid.v4()),
    Question(
        title: "2 + 2 = ?", 
        choices: ["2", "4", "5"], 
        goodChoice: "4",
        score: 50,
        id: uuid.v4()),
];


main() {
  List<String> answerQuestion = ["Paris" , "4"];

  Quiz quiz = Quiz(questions: questions);
  for(var i = 0; i < quiz.questions.length; i++){
    Answer answer = Answer(question: quiz.questions[i], answerChoice: answerQuestion[i]);
    quiz.addAnswer(answer);
  }


  test("Question To Check Score In Percentage" , (){
    expect(quiz.getScoreInPercentage() , equals(100));
  });

  test("Question To Check Score In Point" , (){
    expect(quiz.getTotalPoint,  equals(60));
  });
}
