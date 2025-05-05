import 'package:flutter/material.dart';
import 'package:loggy/66-dars/page/journal_daily_detail.dart';

class QuizProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  final List<Question> _questions = [
    Question(
      text: 'Bugun kayfiyatingiz qanday?',
      options: ["Zo'r", "Yaxshi", "O'rtacha", "Yomon"],
    ),
    Question(
      text: 'Bugun nima foydali ish qildingiz?',
      options: ["Kitob o'qidim",  "Sport bilan shug'ullandim", "Hech narsa", "Ishladim"],
    ),
    Question(
      text: 'Ob havo qanday ',
      options: ["Issiq", "Sovuq", "Salqin", "Iliq"],
    ),
    Question(
      text: 'Kasbingiz nima?',
      options: ["Dasturchi", "Dizayner", "Sportchi", "Boshqa"],
    ),
    Question(
      text: 'Javobigiz uchun rahmat',
      options: [],
    ),

  ];

  List<Question> get questions => _questions;

  void selectAnswer(int index) {
    if (pageController.hasClients && index < _questions.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
class Question {
  final String text;
  final List<String> options;

  Question({required this.text, required this.options});
}