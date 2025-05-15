import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../models/quiz_result.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;
  int totalScore = 0;
  bool isFinished = false;
  
  // Add animation controller
  late AnimationController _buttonController;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  void _answerQuestion(int score) {
    setState(() {
      totalScore += score;
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        isFinished = true;
      }
    });
  }

  QuizResult _getResult() {
    // Сортуємо результати за спаданням minScore
    final sortedResults = List<QuizResult>.from(results)
      ..sort((a, b) => b.minScore.compareTo(a.minScore));
      
    // Шукаємо перший результат, який підходить за набраними балами
    for (var result in sortedResults) {
      if (totalScore >= result.minScore) {
        return result;
      }
    }
    return results.last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // фон додатку
              Color.fromARGB(255, 55, 202, 255),
              Color.fromARGB(255, 201, 240, 255),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: isFinished
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _getResult().imagePath,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _getResult().title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            // Колір тексту заголовка
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _getResult().description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)), // Колір тексту опису
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(204, 29, 118, 202), // Колір кнопки для перезапуску тесту
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              currentQuestionIndex = 0;
                              totalScore = 0;
                              isFinished = false;
                            });
                          },
                          child: const Text(
                            'Пройти тест знову',
                            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Індикатор прогресу
                      LinearProgressIndicator(
                        value: (currentQuestionIndex + 1) / questions.length,
                        backgroundColor: const Color.fromARGB(202, 35, 155, 192), // Колір фону прогрес бару
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(178, 20, 255, 255), // Колір заповнення прогрес бару
                        ),
                        minHeight: 10,
                      ),
                      const SizedBox(height: 20),

                      // Блок відображення номеру поточного питання
                      Text(
                        'Питання ${currentQuestionIndex + 1} з ${questions.length}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      const SizedBox(height: 20),

                      // Блок відображення тексту питання
                      Text(
                        questions[currentQuestionIndex].questionText,
                        style: const TextStyle(fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      const SizedBox(height: 20),

                      // Блок з варіантами відповідей
                      ...questions[currentQuestionIndex]
                          .answers
                          .map(
                            (answer) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AnimatedBuilder(
                                animation: _buttonController,
                                builder: (context, child) => Transform.scale(
                                  scale: 1.0,
                                  // Кнопка варіанту відповіді
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(202, 17, 141, 199), // Колір кнопок відповідей
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      _buttonController.forward().then((_) {
                                        _buttonController.reverse();
                                      });
                                      _answerQuestion(answer.score);
                                    },
                                    child: Text(
                                      answer.text,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 255, 255, 255), // Колір тексту кнопки
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}