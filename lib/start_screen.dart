import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.quizState,{super.key});

  final  void Function()  quizState; //void Function is the data type of the function we are getting 
  //we cannot use the quizState directly in build method therefore we are using a var
  @override


  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, //the column takes minimum space on the screen
        children: [
          Image.asset(
            'assets/assets/images/quiz-logo.png',
            width: 300,
            color:const  Color.fromARGB(150, 255, 255, 255), //transparency of the image 
          ),
          const SizedBox(height: 80.0),
           Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 227, 209, 235),
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 30.0),
          OutlinedButton.icon(
          onPressed: () {
            quizState();
          },
          style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Here')
           ),
          
        ],
      ),
    );
  }
}
