import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  //this list will content the all the selected answer by the user and will be used at the result screen at the end when we ran out of the questions
  List<String> selectedAnswers = [];

  //1. Widget? activeScreen = const StartScreen(switchScreen);
  // 2.Widget? activeScreen;

  //when both variable and method are created simulataneously then it throws error as it can not guarantee that the method exits or not

  //so to solve the error we add the method called : 'initState()'

  //initState will be excuted at first and never gets executed afterward so only used to do extra initialization when the state object is created for the first time
//  2. @override
//   void initState() {
//     super.initState();
//     activeScreen = StartScreen(switchScreen);
//   }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen(chooseAnswer);
  //   });
  // }
  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

    //will get the data from the another class and will add the selected answer by the user to the list so as to use it in the result screen after user ran out of the questions
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen'){
      //passing the function 'chooseAnswer'  where the answer will get added to the list and the values or answer that are to be added to the list is at the another widget state so we pass the function as an argumnet to the constructor of the class 

      //Here the data will be passed throught different widget via function that has been passed as a value to the class
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer);
    }


    if(activeScreen == 'result-screen'){
      screenWidget =  ResultScreen(chosenAnswer: selectedAnswers,);
    }
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
