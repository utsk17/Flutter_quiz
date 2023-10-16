import 'package:flutter/material.dart';
import 'package:quiz_sample/data/questions.dart';
import 'package:quiz_sample/models/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: const TextStyle(
                color: Color.fromARGB(255, 226, 251, 64),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                onRestart(); // Handle button press
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Adjust the mainAxisSize as needed
                children: [
                  Icon(
                    Icons.refresh, // Replace with the icon you want
                    color: Colors.white, // Set the icon color
                  ),
                  SizedBox(
                      width: 8), // Add some spacing between the icon and text
                  Text(
                    'Restart Quiz',
                    style: TextStyle(
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
