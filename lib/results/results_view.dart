import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/results/summary.dart';

class ReslultsView extends StatelessWidget {
  const ReslultsView({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers.first,
        'user_answer': chosenAnswers[i],
        'is_correct': questions[i].answers.first == chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(context) {
    final numOfQuestions = questions.length;
    final numOfCorrectAnswers =
        summaryData
            .where((data) => data['correct_answer'] == data['user_answer'])
            .length; // Arrow function

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numOfCorrectAnswers out of $numOfQuestions questions correctly.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Summary(summaryData: summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: Icon(Icons.reply_rounded, color: Colors.white),
              label: Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
