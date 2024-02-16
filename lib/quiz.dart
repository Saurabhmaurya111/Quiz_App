import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

   void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  } 

 
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
        setState(() {
         
          activeScreen ='results-screen';
        });
     }
    }       
  

 

  @override
  Widget build(context) {

   Widget screenWidget = StartScreen(switchScreen);

   if(activeScreen == 'questions-screen'){
    screenWidget =  QuestionsScreen( onSelectAnswer: chooseAnswer);
   }
   
   if(activeScreen == 'results-screen'){
    screenWidget =  ResultScreen(chosenAnswer: selectedAnswer,);
   }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 19, 181),
            Color.fromARGB(255, 143, 18, 165)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),),
          child: screenWidget,
        ),
      ),
    );
  }
}
