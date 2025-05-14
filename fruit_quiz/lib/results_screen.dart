import 'package:flutter/material.dart'; // Імпорт Flutter
import 'score_logic.dart'; // Імпорт логіки

class ResultsScreen extends StatelessWidget {
  // Віджет екрану результатів
  final int score; // Отриманий бал

  const ResultsScreen({super.key, required this.score}); // Конструктор

  @override
  Widget build(BuildContext context) {
    // Метод побудови
    final result = ScoreLogic.getResult(score); // Отримання результату

    return Scaffold(
      // Каркас
      body: Container(
        // Контейнер для фону
        decoration: const BoxDecoration(
          // Декорація
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.orange],
          ),
        ),
        child: Center(
          // Вирівнювання
          child: Column(
            // Вертикальний список
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // Заголовок
                result['title']!,
                style: const TextStyle(
                  fontFamily: 'ComicSans', // Додано шрифт Comic Sans
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Відступ
              Image.asset(
                // Зображення фрукту
                result['image']!,
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20), // Відступ
              Padding(
                // Текст з відступами
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  result['description']!,
                  style: const TextStyle(
                    fontFamily: 'ComicSans', // Додано шрифт Comic Sans
                    fontSize: 35,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
