import 'package:flutter/material.dart';
import 'package:loggy/66-dars/quiz_provider.dart';
import 'package:loggy/66-dars/widget/answer.dart';
import 'package:provider/provider.dart';
class QuizScreen extends StatelessWidget {
  const QuizScreen();

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: quizProvider.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quizProvider.questions.length,
        itemBuilder: (context, index) {
          final question = quizProvider.questions[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  question.text,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                ...List.generate(
                  question.options.length,
                      (optIndex) => AnswerOption(
                    text: question.options[optIndex],
                    onTap: () => quizProvider.selectAnswer(index),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

