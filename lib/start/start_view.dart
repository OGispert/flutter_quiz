import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          SizedBox(height: 30),
          Text(
            'Learn Flutter the FUN way.',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 80),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: Icon(Icons.play_arrow, color: Colors.white),
            label: Text("Start Quiz!", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
