 
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import "package:uuid/uuid.dart";
import "./data/QuizRespository.dart";

var uuid = new Uuid();
void main() {

  List<Question> questions = [
    Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris", 
        score: 10),
    Question(
        title: "2 + 2 = ?", 
        choices: ["2", "4", "5"], 
        goodChoice: "4",
        score: 50),
  ];

  // Quiz quiz = Quiz(questions: questions , id: uuid.v4());

  QuizRespository quizRespository = new QuizRespository("./data.json");
  QuizConsole console = QuizConsole(quiz: quizRespository.readQuiz());

  console.startQuiz();
}
