import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer,});

  final List<String> chosenAnswer;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i = 0; i < chosenAnswer.length ; i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer':chosenAnswer[i],
       },
      );
    }
    return summary;
  }


  @override
  Widget build(context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data){
        //condition--> data that satisfies the condition will be added to the new list that will be created by the .where method
        return data['user_answer'] == data['correct_answer'];
      }
    ).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',),
            const SizedBox(height: 30,),
            
            QuestionsSummary(summaryData),

            const SizedBox(height: 30,),
            TextButton(
              onPressed: (){},
               child: const Text('Restart Quiz'),
              ),
          ],
        ),
      ),
    );
  }
}
