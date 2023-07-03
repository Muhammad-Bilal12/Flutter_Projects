import "package:basic_quiz_app/question_screen.dart";
import "package:basic_quiz_app/results_screen.dart";
import "package:flutter/material.dart";
import "package:basic_quiz_app/start_screen.dart";
import 'package:basic_quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // 1st approch
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

// 2nd approch
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      currentScreen = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'results-screen') {
      currentScreen = ResultsScreen(
        chooseQuestion: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 58, 25, 114),
                Color.fromARGB(255, 87, 38, 173),
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
