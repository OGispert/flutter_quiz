import 'package:flutter/material.dart';
import 'package:flutter_quiz/results/question_identifier.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionIdentifier(
                      questionIndex: (data['question_index'] as int),
                      isCorrect: (data['is_correct'] as bool),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data['question'] as String),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Your Answer: ${data['user_answer']}',
                            style: TextStyle(
                              color:
                                  (data['is_correct'] as bool)
                                      ? const Color.fromARGB(255, 162, 199, 163)
                                      : const Color.fromARGB(
                                        255,
                                        236,
                                        136,
                                        167,
                                      ),
                            ),
                          ),
                          if (!(data['is_correct'] as bool))
                            Text(
                              'Correct Answer: ${data['correct_answer']}',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 162, 199, 163),
                              ),
                            ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
