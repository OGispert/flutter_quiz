import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsView> createState() {
    return _QuestionsViewState();
  }
}

class _QuestionsViewState extends State<QuestionsView> {
  var questionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      // if (questions.length > questionIndex + 1) {
      questionIndex++;
      // }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnswerButton(
                    answer: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                  SizedBox(height: 10),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
