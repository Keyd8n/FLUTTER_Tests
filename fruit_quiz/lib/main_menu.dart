import 'package:flutter/material.dart'; // Імпорт Flutter для UI
import 'quiz_screen.dart'; // Імпорт екрану тесту

class MainMenu extends StatelessWidget {
  // Віджет головного меню
  const MainMenu({super.key}); // Конструктор

  // Налаштування, які можна змінити
  final String testTitle = "Який ти фрукт? Тест-жарт"; // Назва тесту
  final String buttonText = "Почати тест"; // Текст кнопки
  final String imagePath = "assets/fruit_basket.png"; // Шлях до зображення

  @override
  Widget build(BuildContext context) {
    // Метод побудови
    return Scaffold(
      // Базовий каркас екрану
      body: Container(
        // Контейнер для фону
        decoration: const BoxDecoration(
          // Декорація контейнера
          gradient: LinearGradient(
            // Градієнтний фон
            begin: Alignment.topLeft, // Початок градієнту
            end: Alignment.bottomRight, // Кінець градієнту
            colors: [Colors.green, Colors.orange], // Кольори градієнту
          ),
        ),
        child: Center(
          // Вирівнювання вмісту по центру
          child: Column(
            // Вертикальний список елементів
            mainAxisAlignment:
                MainAxisAlignment.center, // Вирівнювання по центру
            children: [
              Image.asset(
                // Зображення
                imagePath, // Шлях до зображення
                width: 400, // Ширина
                height: 400, // Висота
              ),
              const SizedBox(height: 0), // Відступ
              Text(
                // Текст назви тесту
                testTitle, // Текст
                style: const TextStyle(
                  // Стиль тексту
                  fontFamily: 'ComicSans', // Додано шрифт Comic Sans
                  fontSize: 40, // Розмір шрифту
                  color: Colors.white, // Колір
                  fontWeight: FontWeight.bold, // Жирність
                ),
              ),
              const SizedBox(height: 30), // Відступ
              AnimatedButton(
                // Анімована кнопка
                text: buttonText, // Текст кнопки
                onPressed: () {
                  // Дія при натисканні
                  Navigator.push(
                    // Перехід на інший екран
                    context, // Контекст
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen()), // Новий екран
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  // Віджет анімованої кнопки
  final String text; // Текст кнопки
  final VoidCallback onPressed; // Функція при натисканні

  const AnimatedButton(
      {super.key, required this.text, required this.onPressed}); // Конструктор

  @override
  State<AnimatedButton> createState() =>
      _AnimatedButtonState(); // Створення стану
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  // Стан кнопки з підтримкою анімації
  bool _isHovered = false; // Чи наведено курсор
  bool _isPressed = false; // Чи натиснуто кнопку
  late AnimationController _controller; // Контролер для анімації
  late Animation<double> _shineAnimation; // Анімація для ефекту блиску

  @override
  void initState() {
    super.initState();
    // Ініціалізація контролера анімації
    _controller = AnimationController(
      duration:
          const Duration(milliseconds: 2000), // Тривалість анімації блиску
      vsync: this, // Синхронізація з віджетом
    )..repeat(); // Повторюємо анімацію

    // Налаштування анімації блиску (для градієнту)
    _shineAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Плавна крива анімації
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Очищення контролера при знищенні віджета
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Метод побудови
    return MouseRegion(
      // Область реагування на курсор
      onEnter: (_) => setState(() => _isHovered = true), // При наведенні
      onExit: (_) => setState(() => _isHovered = false), // При відведенні
      child: GestureDetector(
        // Детектор жестів
        onTapDown: (_) => setState(() => _isPressed = true), // При натисканні
        onTapUp: (_) {
          setState(() => _isPressed = false); // При відпусканні
          widget.onPressed(); // Виклик функції onPressed
        },
        onTapCancel: () =>
            setState(() => _isPressed = false), // При скасуванні натискання
        child: AnimatedBuilder(
          // Віджет для анімації блиску
          animation: _shineAnimation,
          builder: (context, child) {
            return Transform(
              // Використовуємо Transform для масштабування з центру
              alignment: Alignment.center, // Точка опори - центр кнопки
              transform: Matrix4.identity()
                ..scale(_isPressed ? 0.95 : 1.0), // Зменшення при натисканні
              child: AnimatedContainer(
                // Анімований контейнер для кнопки
                duration:
                    const Duration(milliseconds: 200), // Тривалість анімації
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Відступи
                decoration: BoxDecoration(
                  // Декорація кнопки
                  gradient: LinearGradient(
                    // Градієнт кнопки
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red, // Початковий колір
                      Colors.lightGreen, // Кінцевий колір
                    ],
                    stops: [
                      // Анімація блиску через зміну зупинок градієнту
                      (_shineAnimation.value < 0)
                          ? 0.0
                          : _shineAnimation.value / 4 + 0.5,
                      (_shineAnimation.value > 0)
                          ? 1.0
                          : _shineAnimation.value / 4 + 0.5,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30), // Закруглення кутів
                  boxShadow: [
                    // Тінь
                    BoxShadow(
                      color: _isHovered
                          ? Colors.red
                              .withOpacity(0.5) // Яскравіша тінь при наведенні
                          : Colors.lightGreen.withOpacity(0.3), // Звичайна тінь
                      blurRadius: _isHovered ? 10 : 5, // Розмиття
                      spreadRadius:
                          _isHovered ? 2 : 0, // Розширення тіні при наведенні
                      offset: const Offset(0, 5), // Зміщення
                    ),
                  ],
                  border: Border.all(
                    // Обведення
                    color: Colors.white
                        .withOpacity(_isHovered ? 0.8 : 1), // Біле обведення
                    width: 3, // Товщина обведення
                  ),
                ),
                child: Text(
                  // Текст кнопки
                  widget.text, // Текст
                  style: TextStyle(
                    // Видалено const
                    fontFamily: 'ComicSans', // Додано шрифт Comic Sans
                    fontSize: 28, // Розмір шрифту
                    color: Colors.white, // Колір тексту
                    fontWeight: FontWeight.bold, // Жирність
                    shadows: [
                      // Тінь тексту для кращої читабельності
                      Shadow(
                        color: Colors.black.withOpacity(0.3), // Залишаємо як є
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
