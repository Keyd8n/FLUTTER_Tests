import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  Map<String, int> _score = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0, 'F': 0};
  String? _selectedAnswer;

  void _nextQuestion() {
    if (_selectedAnswer != null) {
      setState(() {
        _score[_selectedAnswer!] = (_score[_selectedAnswer!] ?? 0) + 1;
        if (_questionIndex < questions.length - 1) {
          _questionIndex++;
          _selectedAnswer = null;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(answers: _score),
            ),
          );
        }
      });
    }
  }

  void _previousQuestion() {
    if (_questionIndex > 0) {
      setState(() {
        _questionIndex--;
        _selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionData = questions[_questionIndex];
    final String questionText = questionData['question'] ?? 'Питання відсутнє';
    final Map<String, String> answers =
        (questionData['answers'] as Map<String, String>?) ?? {};

    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          margin: const EdgeInsets.all(16),
          child: Container(
            width: 700,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  questionText,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...answers.entries.map(
                  (entry) => RadioListTile<String>(
                    title:
                        Text(entry.value, style: const TextStyle(fontSize: 22)),
                    value: entry.key,
                    groupValue: _selectedAnswer,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _selectedAnswer = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (_questionIndex > 0)
                      ElevatedButton(
                        onPressed: _previousQuestion,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        child: const Text('Попереднє'),
                      )
                    else
                      const SizedBox(width: 110),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: _selectedAnswer != null ? _nextQuestion : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 30),
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      child: Text(_questionIndex == questions.length - 1
                          ? 'Завершити'
                          : 'Далі'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
