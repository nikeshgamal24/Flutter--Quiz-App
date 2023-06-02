import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  //we passed StartScreen a positional parameter i.e. a function to switch to the quiz
  final Function()? startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //One way to apply opacity in the images is to wrap the image in the another Widget called opacity and then use opacity property in it like as shown below
          // Opacity(
          //   opacity:1.0,
          //   child: Image.asset(
          //     'assets/images/logo.png',
          //     width: 200,
          //   ),
          // ),

          //2nd approach is to use color property within Image class that will act as an overlay to the image that we use for
          Image.asset(
            'assets/images/logo.png',
            width: 200,
            // color:const Color.fromARGB(192, 255, 255, 255),   //this line is for the opacity of the image
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the Fun way!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),

          //For the icon on the button or elsewhere we use like OutlinedButton.icon and can use icon property and use certain given icon to the place where we want to place the icon at

          OutlinedButton.icon(
              //startQuiz contains the function that will change the activescreen to QuestionsScreen so the value startQuiz variable contains the function body
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 24,
                  )),
              //While using the icon the child --> label
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                'Start Quiz',
              ))
        ],
      ),
    );
  }
}
