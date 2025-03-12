import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        backgroundColor: const Color.fromARGB(255, 1, 24, 43),
        foregroundColor: Colors.white,
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: GoogleFonts.acme(fontSize: 14),
      ),
    );
  }
}
