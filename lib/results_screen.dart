

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,
  required this.choosenAnwers,
  required this.onRestart,
  });

  final void Function() onRestart;
  final List<String>choosenAnwers;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i =0; i<choosenAnwers.length;i++){
      summary.add({
        'question_index':i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : choosenAnwers[i]
      },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;



    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
             style:GoogleFonts.lato(
              color:const Color.fromARGB(255, 230, 200, 253),
              fontSize: 20,
              fontWeight : FontWeight.bold,

             ),
             textAlign: TextAlign.center,
             ),
            const SizedBox(
              height: 30,
            ),
           SummaryData(summaryData),
            const SizedBox(
              height: 30.0,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon:const Icon(Icons.refresh),
              label : const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
