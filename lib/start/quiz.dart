import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions/questions_view.dart';
import 'package:flutter_quiz/start/start_view.dart';
import 'package:flutter_quiz/results/results_view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeView = "start";

  // @override
  // void initState() {
  //   activeView = StartView(switchView);
  //   super.initState();
  // }

  void switchView() {
    setState(() {
      selectedAnswers = [];
      activeView = "questions";
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeView = "results";
      });
    }
  }

  @override
  Widget build(context) {
    Widget view = StartView(switchView);
    if (activeView == "questions") {
      view = QuestionsView(onSelectAnswer: chosenAnswer);
    }

    if (activeView == "results") {
      view = ReslultsView(
        chosenAnswers: selectedAnswers,
        restartQuiz: switchView,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, const Color.fromARGB(255, 26, 33, 178)],
            ),
          ),
          child: view,
        ),
      ),
    );
  }
}
