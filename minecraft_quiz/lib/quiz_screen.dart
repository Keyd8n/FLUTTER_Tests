import 'package:flutter/material.dart'; // Імпорт Flutter
import 'results_screen.dart'; // Імпорт екрану результатів

class QuizScreen extends StatefulWidget {
  // Віджет екрану тесту
  const QuizScreen({super.key}); // Конструктор

  @override
  State<QuizScreen> createState() => _QuizScreenState(); // Створення стану
}

class _QuizScreenState extends State<QuizScreen> {
  // Стан екрану
  int currentQuestion = 0; // Поточне питання (індекс)
  int totalScore = 0; // Загальний бал

  // Список із 10 питань та відповідей (можна редагувати)
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Який колір тобі найближчий за настроєм?',
      'answers': ['Синій – спокій і мудрість', 'Червоний – енергія та пристрасть', 'Зелений – гармонія і природа', 'Чорний – сила і стійкість']
    },
    {
      'question': 'Яке середовище тобі найкомфортніше?',
      'answers': ['Бібліотека або кабінет', 'Вулкан або місце з адреналіном', 'Луг або сад', 'Печера чи фортеця']
    },
    {
      'question': 'Що ти любиш робити у вільний час?',
      'answers': ['Грати на комп’ютері', 'Бігати на вулиці', 'Малювати або майструвати', 'Думати і розв’язувати загадки']
    },
     {
      'question': 'Який настрій у тебе найчастіше?',
      'answers': ['Веселий', 'Сміливий', 'Спокійний', 'Сильний і трохи мовчазний']
    },
     {
      'question': 'Де тобі хотілося б жити в Minecraft?',
      'answers': ['У гарному зеленому будиночку', 'Біля лави', 'У будинку з книжками та картинами', 'Глибоко в шахті чи фортеці']
    },
     {
      'question': 'Як ти реагуєш, коли хтось просить про допомогу?',
      'answers': ['З радістю допоможу!', 'Спочатку думаю, а потім вирішую', 'Якщо це щось веселе — я в справі!', 'Я завжди серйозно ставлюсь до допомоги']
    },
     {
      'question': 'Як ти працюєш у команді?',
      'answers': ['Обираю аналітичну роль, планую.', 'Надихаю інших і заряджаю енергією.', 'Слухаю всіх і пропоную ідеї.', 'Вирішую проблеми і виконую складні завдання.']
    },
     {
      'question': 'Що тобі більше подобається?',
      'answers': ['Природа і квіти', 'Вогонь і пригоди', 'Будувати щось нове', 'Темні печери і таємниці']
    },
    {
      'question': 'Як ти хочеш, щоб тебе запам’ятали?',
      'answers': ['Як доброго і веселого', 'Як хороброго і сміливого', 'Як розумного і креативного', 'Як сильного і мовчазного']
    },
  ];

  void answerQuestion(int score) {
    // Обробка відповіді
    setState(() {
      // Оновлення стану
      totalScore += score; // Додавання балів
      if (currentQuestion < 8) {
        // Якщо не останнє питання
        currentQuestion++; // Перехід до наступного
      } else {
        // Якщо останнє питання
        Navigator.pushReplacement(
          // Перехід до результатів
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(score: totalScore),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Метод побудови
    return Scaffold(
      // Каркас екрану
      body: Container(
        // Контейнер для фону
        decoration: const BoxDecoration(
          // Декорація
          gradient: LinearGradient(
            // Градієнт
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green, Colors.lightGreen],
          ),
        ),
        child: Center(
          // Вирівнювання по центру
          child: Column(
            // Вертикальний список
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // Текст питання
                questions[currentQuestion]['question'],
                style: const TextStyle(
                  fontFamily: 'ComicSans', // Додано шрифт Comic Sans
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Відступ
              ...List.generate(
                // Генерація 4 кнопок відповідей
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AnswerButton(
                    text: questions[currentQuestion]['answers'][index],
                    onPressed: () =>
                        answerQuestion(index + 1), // Бали від 1 до 4
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerButton extends StatefulWidget {
  // Віджет кнопки відповіді
  final String text; // Текст кнопки
  final VoidCallback onPressed; // Дія при натисканні

  const AnswerButton({super.key, required this.text, required this.onPressed});

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton>
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
                width: 500, // Фіксована ширина
                padding: const EdgeInsets.symmetric(vertical: 15), // Відступи
                decoration: BoxDecoration(
                  // Декорація кнопки
                  gradient: LinearGradient(
                    // Градієнт кнопки, що доповнює фон
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red, // Початковий колір
                      Colors.lightBlue, // Кінцевий колір
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
                          ? Colors.orange
                              .withOpacity(0.5) // Яскравіша тінь при наведенні
                          : Colors.purple.withOpacity(0.3), // Звичайна тінь
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // Стиль тексту
                    fontFamily: 'ComicSans', // Додано шрифт Comic Sans
                    fontSize: 28, // Розмір шрифту
                    color: _isHovered
                        ? Colors.white
                        : Colors.white, // Колір тексту
                    fontWeight: FontWeight.bold, // Жирність
                    shadows: [
                      // Тінь тексту для кращої читабельності
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
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
