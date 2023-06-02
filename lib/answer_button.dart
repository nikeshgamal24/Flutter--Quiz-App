import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  // Here we are using the name argumnet instead of positional argument
 const AnswerButton({super.key,required this.answerText, required this.onTap,});

 final String answerText;
 final void Function() onTap;

  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.only(top:10),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
        ),
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
          ),
        ),
    );
  }
}