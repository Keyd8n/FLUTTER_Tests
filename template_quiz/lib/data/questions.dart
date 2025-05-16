import '../models/question.dart';
import '../models/quiz_result.dart';

final List<Question> questions = [
  Question(
    questionText: 'Який твій стиль життя?',
    answers: [
      Answer(text: 'Спокійний, стабільний, люблю комфорт', score: 1),
      Answer(text: 'Динамічний, завжди в русі', score: 2),
      Answer(text: 'Практичний, але сучасний', score: 3),
      Answer(text: 'Ексклюзивний, розкіш понад усе', score: 4),
      Answer(text: 'Екологічний і технологічний', score: 3),
      Answer(text: 'Готовий до пригод і бездоріжжя', score: 2),
    ],
  ),
  Question(
    questionText: 'Що для тебе головне у транспорті?',
    answers: [
      Answer(text: 'Надійність і зручність', score: 1),
      Answer(text: 'Швидкість і драйв', score: 2),
      Answer(text: 'Економність і функціональність', score: 3),
      Answer(text: 'Статус і імідж', score: 4),
      Answer(text: 'Новітні технології та екологічність', score: 3),
      Answer(text: 'Прохідність і витривалість', score: 2),
    ],
  ),
  Question(
    questionText: 'Як ти зазвичай проводиш вихідні?',
    answers: [
      Answer(text: 'Вдома або у родинному колі', score: 1),
      Answer(text: 'Активно: спорт, тусовки, подорожі', score: 2),
      Answer(text: 'Спокійно, можливо за містом', score: 3),
      Answer(text: 'Вишукано: ресторани, театри, події', score: 4),
      Answer(text: 'Експериментую з новим, навчаюсь', score: 3),
      Answer(text: 'Подорожую на природу, в гори або ліс', score: 2),
    ],
  ),
  Question(
    questionText: 'Яка твоя улюблена пора року?',
    answers: [
      Answer(text: 'Весна — новий початок', score: 1),
      Answer(text: 'Літо — свобода і драйв', score: 2),
      Answer(text: 'Осінь — затишок і роздуми', score: 3),
      Answer(text: 'Будь-яка, якщо з комфортом', score: 4),
      Answer(text: 'Майбутнє — час не має значення', score: 3),
      Answer(text: 'Зима — виклики та пригоди', score: 2),
    ],
  ),
  Question(
    questionText: 'Яка музика тобі більше подобається?',
    answers: [
      Answer(text: 'Класика або легкий джаз', score: 1),
      Answer(text: 'Рок або електроніка', score: 2),
      Answer(text: 'Поп або хіти 2000-х', score: 3),
      Answer(text: 'Інструментальна або lounge', score: 4),
      Answer(text: 'Щось нове з Spotify чи YouTube', score: 3),
      Answer(text: 'Саундтреки до фільмів про подорожі', score: 2),
    ],
  ),
];


// Утилітний метод для розрахунку порогу
int calculateThreshold(int totalQuestions, double percentage) {
  return (totalQuestions * 4 * percentage).round();
}

final List<QuizResult> results = [
    QuizResult(
      title: 'Ви - Toyota Camry!',
      description: 'Ти — як Toyota Camry: спокійний, надійний і практичний. Обираєш комфорт, довговічність і не любиш зайвих ризиків.',
      imagePath: 'assets/images/camry.png',
      minScore: calculateThreshold(questions.length, 0.2), // 0% від максимуму
    ),
    QuizResult(
      title: 'Ви - BMW M3!',
      description: 'Ти — BMW M3: стильний, швидкий і емоційний. Любиш драйв, свободу та вмієш жити на повну.',
      imagePath: 'assets/images/bmw_m3.png',
      minScore: calculateThreshold(questions.length, 0.4), // 25% від максимуму
    ),
    QuizResult(
      title: 'Ви - Volkswagen Golf!',
      description: 'Ти — Golf: стриманий, зручний і універсальний. Знаєш ціну грошам і час не витрачаєш даремно.',
      imagePath: 'assets/images/golf.png',
      minScore: calculateThreshold(questions.length, 0.6), // 50% від максимуму
    ),
    QuizResult(
      title: 'Ви - Mercedes-Benz S-Class!',
      description: 'Ти — Mercedes S-Class: розкіш, елегантність і враження. Усе має бути найвищого класу.',
      imagePath: 'assets/images/sclass.png',
      minScore: calculateThreshold(questions.length, 0.8), // 75% від максимуму
    ),
    QuizResult(
      title: 'Ви - Tesla Model 3!',
      description: 'Ти — Tesla: інноваційний, розумний і завжди крок попереду. Думаєш про майбутнє і обираєш розумні рішення.',
      imagePath: 'assets/images/tesla1.png',
      minScore: calculateThreshold(questions.length, 0.9), // 100% від максимуму
    ),
  ];


