import 'dart:convert';
import "dart:io";
import "../domain/quiz.dart";

class QuizRespository{
  final String filePath;

  QuizRespository(this.filePath);

  Quiz readQuiz(){
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    var questionJson = data as List;
    var questions = questionJson.map((q){
      return Question(
        title: q["title"],
        choices: List<String>.from(q["choices"]),
        goodChoice: q["goodChoice"],
        score: q["score"],
      );
    }).toList();

    return Quiz(questions: questions);
  }
}
