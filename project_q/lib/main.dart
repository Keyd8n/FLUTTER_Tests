import 'package:flutter/material.dart';

void main() {
  runApp(GreekHeroQuizApp());
}

class GreekHeroQuizApp extends StatelessWidget {
  const GreekHeroQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greek Hero Quiz',
      theme: ThemeData(
        fontFamily: 'Georgia',
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class Question {
  final String text;
  final List<Answer> answers;
  Question({required this.text, required this.answers});
}

class Answer {
  final String text;
  final String character;
  Answer({required this.text, required this.character});
}

final List<Question> questions = [
  Question(
    text: 'Що для тебе найважливіше?',
    answers: [
      Answer(text: 'Мудрість і філософія', character: 'Socrates'),
      Answer(text: 'Перемоги та слава', character: 'Alexander'),
      Answer(text: 'Допомога людям', character: 'Hippocrates'),
      Answer(text: 'Честь і справедливість', character: 'Achilles'),
      Answer(text: 'Пошук істини', character: 'Aristotle'),
    ],
  ),
  Question(
    text: 'Який твій стиль вирішення проблем?',
    answers: [
      Answer(text: 'Діалог та аналіз', character: 'Socrates'),
      Answer(text: 'Швидке рішення та дія', character: 'Alexander'),
      Answer(text: 'Спокій та логіка', character: 'Hippocrates'),
      Answer(text: 'Серце та емоції', character: 'Achilles'),
      Answer(text: 'Методичне дослідження', character: 'Aristotle'),
    ],
  ),
  Question(
    text: 'Яку справу ти б обрав?',
    answers: [
      Answer(text: 'Філософія', character: 'Socrates'),
      Answer(text: 'Військова справа', character: 'Alexander'),
      Answer(text: 'Медицина', character: 'Hippocrates'),
      Answer(text: 'Героїзм', character: 'Achilles'),
      Answer(text: 'Наука', character: 'Aristotle'),
    ],
  ),
  Question(
    text: 'Який із цих ідеалів тобі ближчий?',
    answers: [
      Answer(text: 'Знання', character: 'Socrates'),
      Answer(text: 'Сила', character: 'Alexander'),
      Answer(text: 'Добро', character: 'Hippocrates'),
      Answer(text: 'Відвага', character: 'Achilles'),
      Answer(text: 'Розуміння', character: 'Aristotle'),
    ],
  ),
  Question(
    text: 'Що тебе мотивує найбільше?',
    answers: [
      Answer(text: 'Бажання вчитися', character: 'Socrates'),
      Answer(text: 'Досягнення та завоювання', character: 'Alexander'),
      Answer(text: 'Бажання допомагати іншим', character: 'Hippocrates'),
      Answer(text: 'Захист честі', character: 'Achilles'),
      Answer(text: 'Пошук істини', character: 'Aristotle'),
    ],
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Який ти грецький діяч?')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/quiz_logo2.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 24),
              Text(
                'Визнач, хто ти з великих грецьких героїв!\n\nСтворений студентами кафедри комп\'ютерних наук',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.play_arrow),
                label: Text('Почати тест'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
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

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  Map<String, int> score = {
    'Socrates': 0,
    'Alexander': 0,
    'Hippocrates': 0,
    'Achilles': 0,
    'Aristotle': 0,
  };

  void answerQuestion(String character) {
    score[character] = (score[character] ?? 0) + 1;
    
    // Check if we've reached the end before updating state
    if (currentQuestion >= questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: score)),
      );
    } else {
      setState(() {
        currentQuestion++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(
        title: Text('Питання ${currentQuestion + 1} з ${questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  question.text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                ...question.answers.map(
                  (a) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ElevatedButton(
                      onPressed: () => answerQuestion(a.character),
                      child: Text(a.text),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final Map<String, int> score;
  const ResultScreen({super.key, required this.score});

  String getResultCharacter() {
    String result = '';
    int max = 0;
    score.forEach((char, points) {
      if (points > max) {
        max = points;
        result = char;
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final result = getResultCharacter();

    Map<String, String> descriptions = {
      'Socrates': 'Ти мислитель і любиш глибокі роздуми.',
      'Alexander': 'Ти — лідер, здатний вести за собою.',
      'Hippocrates': 'Ти — цілитель, завжди готовий допомогти.',
      'Achilles': 'Ти — герой, керований почуттями.',
      'Aristotle': 'Ти — науковець, шукаєш істину в усьому.',
    };

    Map<String, String> avatars = {
      'Socrates': 'assets/socrates.png',
      'Alexander': 'assets/alexander.png',
      'Hippocrates': 'assets/hippocrates.png',
      'Achilles': 'assets/achilles.png',
      'Aristotle': 'assets/aristotle.png',
    };

    return Scaffold(
      appBar: AppBar(title: Text('Твій результат')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (avatars[result] != null)
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(avatars[result]!),
                    ),
                  SizedBox(height: 16),
                  Text(
                    'Ти — $result!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    descriptions[result] ?? '',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: Icon(Icons.refresh),
                    label: Text('Пройти ще раз'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
