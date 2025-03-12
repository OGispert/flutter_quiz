import 'package:flutter/material.dart';
import 'package:flutter_quiz/start/quiz.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(context) {
    return Quiz();
  }
}
