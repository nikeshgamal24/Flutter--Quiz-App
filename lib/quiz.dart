import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  // Widget? activeScreen = const StartScreen(switchScreen);
  Widget? activeScreen;

  //when both variable and method are created simulataneously then it throws error as it can not guarantee that the method exits or not 

  //so to solve the error we add the method called : 'initState()'

  //initState will be excuted at first and never gets executed afterward so only used to do extra initialization when the state object is created for the first time 
  @override
  void initState(){
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen(){
    setState(() {
    activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
     home: Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
        ),
        child:activeScreen,
        ),
      ),
     );
  }
}