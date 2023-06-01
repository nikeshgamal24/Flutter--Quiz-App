import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState(){
    return _QuestionScreenState();
  }
}

//While using the StatefulWidget we have to override a function 'createState' that returns the state of the class type as it is returns the value that is of the genric type 

//while returning the state it uses the private class to return the state because the state is normally represented as a private member filed 

//so we create a private class that can be operated only to this particular file even if the file is imported to the other file the private class will return the widget throught its function build() of that particular given state of the framework of UI
 
class _QuestionScreenState extends State<QuestionsScreen>{
  @override
  Widget build(context){
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
        'Questions for Quiz app',
        style: TextStyle(
          color: Colors.white,
          fontSize:24,
        ),
        ),
        ],
      ) 
    ); 
   }
}