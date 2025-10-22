class Question{
  final String? id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  int? score;

  Question({this.id , required this.title, required this.choices, required this.goodChoice, required this.score});
}

class Answer{
  final String? id;
  final Question question;
  final String answerChoice;
  

  Answer({this.id , required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  final String? id;
  List<Question> questions;
  List<Answer> answers =[];
  List<Player> player=[];
  int totalPoint = 0;

  Quiz({this.id , required this.questions});

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }
  void addPlayer(Player newPlayer){
    int flag = 0;
    if(this.player.isEmpty){
      this.player.add(newPlayer);
    }else{
      for(var player in this.player){
        if(player.playerName == newPlayer.playerName){
          player.setPlayerPoint = newPlayer.playerPoint!;
          flag = 1;
        }
      }

      if(flag == 0){
        this.player.add(newPlayer);
      }
    }
  }

  int get getTotalPoint => this.totalPoint;

  void calculatePoint({required int score}){
    this.totalPoint = this.totalPoint + score;
  }

  int getScoreInPercentage(){
    int totalSCore = 0;
    for(Answer answer in answers){
      if (answer.isGood()) {
        calculatePoint(score: answer.question.score!);
        totalSCore++;
      }
    }
    return ((totalSCore/ questions.length)*100).toInt();
  }
}

class Player{
  String? id;
  String? playerName;
  int? playerPoint;

  Player({required this.playerName, required this.playerPoint , this.id});

  set setPlayerPoint(int point) => this.playerPoint = point;


}