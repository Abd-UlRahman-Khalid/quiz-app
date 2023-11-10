import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import  'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz ({super.key});

  @override
  State <Quiz> createState(){
    return _QuizState(); 
  }

}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  void choosedAnswers(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
        actveScreen='results-screen';
              });
    }
  }
  
  var actveScreen='switchScreen';
  void switchScreen (){
    setState(() {
      actveScreen='question-screen';
    });
  }

  void ResetQuiz(){
    setState(() {
      selectedAnswers=[];
      actveScreen='question-screen';
    });
  }

  @override
  Widget build(context){
    Widget screenWidget=StartScreen(switchScreen);

    if(actveScreen=='question-screen'){
      screenWidget=  QuestionsScreen(onsSelectedAnswer: choosedAnswers);
    }
    if(actveScreen=='start-screen'){
      screenWidget=StartScreen(switchScreen);
    }

    if(actveScreen=='results-screen'){
      screenWidget= ResultsScreen(choosenAnswers:selectedAnswers,onRestart: ResetQuiz,);
    }
    return  MaterialApp(
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