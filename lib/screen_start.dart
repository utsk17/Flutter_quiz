import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/pic/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 248, 248, 248),
          ),
          const Padding(padding: EdgeInsets.only(top: 80)),
          Text(
            'Best of Luck',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.account_tree),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
