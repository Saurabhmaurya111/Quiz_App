import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_Index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build( BuildContext context) {
     final summaryData = getSummaryData();
     final numTotalQuestion = questions.length;
     final numCorrectQuestion = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
     }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered $numCorrectQuestion out of $numTotalQuestion questions Correctly!',
             style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 240, 235, 235),
              fontSize: 20,
              fontWeight: FontWeight.bold,
             ), 
             ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
