import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  //a variable of type widget
 var  activeScreen = 'start-screen';
  // here we dont add () otherwisw function would be called right at that time.
 

  void switchtScreen() {
    setState(() {
        activeScreen ='questions-screen' ;
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length  == questions.length ){
      setState(() {
       
      activeScreen = 'results-screen';
      });
      
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchtScreen);
    if(activeScreen == 'questions-screen'){
      screenWidget =  QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(
        choosenAnwers: selectedAnswers,
        onRestart: restartQuiz,
        );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
