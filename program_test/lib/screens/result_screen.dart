import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, int> answers;

  const ResultScreen({super.key, required this.answers});

  Map<String, Map<String, String>> getResults() {
    return {
      'A': {
        'name': 'Java',
        'description':
            'Ти стабільний, надійний і послідовний. Ти цінуєш структурований підхід до роботи та любиш, коли все працює за чіткими правилами. Твоє мислення схоже на корпоративний стиль: ти віддаєш перевагу надійності та масштабованості замість експериментів. Java часто використовується у великих бізнес-проектах, банківських системах і мобільних додатках для Android. Ти той, хто не кидає справу на півдорозі, але інколи можеш бути занадто консервативним.',
        'image': 'assets/images/java.png',
      },
      'B': {
        'name': 'JavaScript',
        'description':
            'Ти адаптивний, швидкий і креативний. Ти легко пристосовуєшся до змін і любиш, коли технології розвиваються швидко. Якщо тобі потрібно швидко щось написати та побачити результат ти тут як тут! JS – мова фронтенду, а значить, ти любиш працювати з UI/UX, створювати анімації та інтерактивність. Ти відкритий до експериментів, але іноді можеш братися за занадто багато речей одночасно.',
        'image': 'assets/images/javascript.png',
      },
      'C': {
        'name': 'Python',
        'description':
            'Ти логічний, спокійний і розважливий. Ти любиш простоту та читабельність коду і не витрачаєш час на зайве. Якщо потрібно вирішити складну задачу – ти зробиш це максимально елегантно та мінімалістично. Python ідеально підходить для наукових досліджень, машинного навчання та автоматизації, тож, можливо, ти мислиш як аналітик. Але іноді твоя любов до простоти може обмежувати експерименти.',
        'image': 'assets/images/python.png',
      },
      'D': {
        'name': 'C++',
        'description':
            'Ти впевнений, аналітичний і завжди націлений на ефективність. Ти любиш повний контроль над тим, що відбувається, і не боїшся складних викликів. C++ використовується в ігровій індустрії, робототехніці та високопродуктивному програмуванні, тож, швидше за все, ти звик працювати зі складними алгоритмами. Але будь обережний – іноді ти можеш занадто заглиблюватися в деталі, замість того щоб рухатися вперед.',
        'image': 'assets/images/cpp.png',
      },
      'E': {
        'name': 'Flutter (Dart)',
        'description':
            'Ти інноваційний, відкритий і любиш універсальність. Ти завжди шукаєш кращі та новіші рішення, не боїшся пробувати щось незвичайне. Flutter – це кросплатформена технологія, яка дозволяє створювати застосунки одразу для iOS, Android та Web. Це означає, що ти любиш гнучкість і хочеш створювати речі, які будуть зручними для всіх. Але не забувай, що експериментувати – це добре, але стабільність теж важлива.',
        'image': 'assets/images/flutter.png',
      },
      'F': {
        'name': 'PHP',
        'description':
            'Ти практичний, швидкий і віддаєш перевагу реальним результатам. Ти не любиш витрачати час на зайві деталі та обираєш те, що вже добре працює. PHP залишається одним із головних рушіїв веб-розробки, а значить, ти людина, яка вміє швидко створювати робочі рішення. Ти чудово підходиш для розробки сайтів, CMS та бекенд-систем, але іноді твоя любов до швидкості може призводити до того, що код виходить не таким структурованим, як хотілося б.',
        'image': 'assets/images/php.png',
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    var sorted = answers.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    String topAnswer = sorted.first.key;

    var result = getResults()[topAnswer] ??
        {
          'name': 'Невідомо',
          'description': 'Не вдалося визначити мову програмування :(',
          'image': 'assets/images/unknown.png',
        };

    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          margin: const EdgeInsets.all(20),
          child: Container(
            width: 700,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  result['image']!,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  result['name']!,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  result['description']!,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Пройти ще раз'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
