import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz; 
  String? playerName;

  set setPlayerName(String newName) => this.playerName = newName;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while(true){
 
    
      stdout.write("Your name : ");
      this.playerName = stdin.readLineSync();

      if(this.playerName == " " || this.playerName!.isEmpty){
        break;
      }
      for (var question in quiz.questions) {
          print('Question: ${question.title} - ( ${question.score} points )');
          print('Choices: ${question.choices}');
          stdout.write('Your answer: ');
          String? userInput = stdin.readLineSync();

        // Check for null input
        if(userInput != null && userInput.isNotEmpty) {
            Answer answer = Answer(question: question, answerChoice: userInput);
            quiz.addAnswer(answer);
        }else {
            print('No answer entered. Skipping question.');
          }

          print('');
        }

        int score = quiz.getScoreInPercentage();
        int totalPoint = quiz.getTotalPoint;
        Player player = new Player(playerName: this.playerName , playerPoint: totalPoint);
        quiz.addPlayer(player);

        print('${player.playerName} Yours score: $score % correct');
        print("${player.playerName} Your score in points : ${player.playerPoint}");
        quiz.totalPoint = 0;
        this.playerName = " ";
        quiz.answers = [];
      }
      print('--- Quiz Finished ---');
    }
    
}
 