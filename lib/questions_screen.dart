import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:adv_basics/data/questions.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  //onSelectAnswer is available in this QustionScreen class but not available in the _QuestionScreenState class where all the state are represented 

  //so for that to have the access of this class in the _QuestionScreenState class we use the 'widget.' instance variable or property in the _QuestionScreenState
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}


//While using the StatefulWidget we have to override a function 'createState' that returns the state of the class type as it is returns the value that is of the genric type

//while returning the state it uses the private class to return the state because the state is normally represented as a private member filed

//so we create a private class that can be operated only to this particular file even if the file is imported to the other file the private class will return the widget throught its function build() of that particular given state of the framework of UI

class _QuestionScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectAnswer){
    //widget helps to give the access of the Widget class and its methods
    widget.onSelectAnswer(selectAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30,),
            //no of answer button should be based on the available answer for that we use mapping 

            //here getShuffledAnswer() funciton will return the shuffledlist and then the mapping of the list is done so this is also a example of chaining of methods

            // and mapping helps to convert the list of string into behave as a widget
            ...currentQuestion.getShuffledAnswer().map((answer){
              return AnswerButton(answerText: answer, onTap:(){
                answerQuestion(answer);
              },);
            })
      
            //Hardcoding the answer button options ---> not appropriate
            // AnswerButton(answerText:'Answer 1',onTap:(){},),
            //  const SizedBox(height: 20,),
            // AnswerButton(answerText:'Answer 2',onTap:(){},),
            //  const SizedBox(height: 20,),
            // AnswerButton(answerText:'Answer 3',onTap:(){},),
            // const SizedBox(height: 20,),
            // AnswerButton(answerText:'Answer 4',onTap:(){},),
          ],
        ),
      ),
    );
  }
}
