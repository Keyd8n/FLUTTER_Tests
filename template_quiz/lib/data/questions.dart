import '../models/question.dart';
import '../models/quiz_result.dart';

final List<Question> questions = [
  Question(
    questionText: 'Як ти зазвичай приймаєш рішення у складній ситуації?',
    answers: [
      Answer(text: 'Ретельно аналізую всі варіанти', score: 1),
      Answer(text: 'Іду шляхом інтуїції', score: 2),
      Answer(text: 'Приймаю рішення швидко і впевнено', score: 3),
      Answer(text: 'Консультуюсь з іншими та дію спільно', score: 4),
      Answer(text: 'Приймаю нестандартні рішення', score: 3),
      Answer(text: 'Оцінюю, що вигідно саме мені', score: 2),
    ],
  ),
  Question(
    questionText: 'Як ти ставишся до влади?',
    answers: [
      Answer(text: 'Це відповідальність', score: 1),
      Answer(text: 'Це виклик і шанс змінити світ', score: 2),
      Answer(text: 'Це інструмент для наведення порядку', score: 3),
      Answer(text: 'Це можливість служити людям', score: 4),
      Answer(text: 'Це спосіб реалізувати себе', score: 3),
      Answer(text: 'Це засіб для досягнення цілей', score: 2),
    ],
  ),
  Question(
    questionText: 'Коли ти зазвичай заходиш у соцмережі?',
    answers: [
      Answer(text: 'Ввечері, щоб почитати новини', score: 1),
      Answer(text: 'Цілий день, щоб бути в курсі', score: 2),
      Answer(text: 'Коли хочу поділитися фото або настроєм', score: 3),
      Answer(text: 'Коли маю, що сказати або прочитати', score: 4),
      Answer(text: 'Під час роботи або для саморозвитку', score: 3),
      Answer(text: 'Коли нудно або є вільна хвилинка', score: 2),
    ],
  ),

  Question(
    questionText: 'Як ти ведеш себе в конфлікті?',
    answers: [
      Answer(text: 'Шукаю компроміс', score: 1),
      Answer(text: 'Вражаю нестандартними ходами', score: 2),
      Answer(text: 'Доміную і контролюю ситуацію', score: 3),
      Answer(text: 'Слухаю кожного і дію мудро', score: 4),
      Answer(text: 'Уникаю прямої конфронтації', score: 3),
      Answer(text: 'Вибираю вигідну для себе сторону', score: 2),
    ],
  ),
  Question(
    questionText: 'Яка твоя головна сила?',
    answers: [
      Answer(text: 'Мудрість і стратегія', score: 1),
      Answer(text: 'Харизма і креативність', score: 2),
      Answer(text: 'Рішучість і сила волі', score: 3),
      Answer(text: 'Лояльність і співчуття', score: 4),
      Answer(text: 'Інтелект і гнучкість', score: 3),
      Answer(text: 'Хитрість і практичність', score: 2),
    ],
  ),
  Question(
    questionText: 'Що тебе найбільше мотивує?',
    answers: [
      Answer(text: 'Довгостроковий успіх', score: 1),
      Answer(text: 'Натхнення та ідеї', score: 2),
      Answer(text: 'Влада та вплив', score: 3),
      Answer(text: 'Справедливість і служіння', score: 4),
      Answer(text: 'Прогрес і розвиток', score: 3),
      Answer(text: 'Особиста вигода', score: 2),
    ],
  ),
  Question(
    questionText: 'Як ти дієш у новій незнайомій ситуації?',
    answers: [
      Answer(text: 'Спираюся на досвід минулого', score: 1),
      Answer(text: 'Імпровізую', score: 2),
      Answer(text: 'Дію впевнено і рішуче', score: 3),
      Answer(text: 'Об\'єдную всіх навколо себе', score: 4),
      Answer(text: 'Шукаю нові підходи', score: 3),
      Answer(text: 'Розраховую, що принесе користь', score: 2),
    ],
  ),
];




// Утилітний метод для розрахунку порогу
int calculateThreshold(int totalQuestions, double percentage) {
  return (totalQuestions * 4 * percentage).round();
}

final List<QuizResult> results = [
  QuizResult(
    title: 'Ти – Шпіоніро Голубіро!',
    description: 'Ти – швидкість та жага до нових вражень! Ти не боїшся ризикувати та завжди відкритий для захопливих пригод.',
    imagePath: 'assets/images/golubiro.png', // Замініть на свій шлях до зображення
    minScore: calculateThreshold(questions.length, 0.2),
  ),

  QuizResult(
    title: 'TikTok',
    description: 'Ти — в центрі уваги. Тебе легко надихнути, ти швидко адаптуєшся до нового та любиш розважати й бути в тренді. TikTok — це твоя стихія: короткий, яскравий, енергійний.',
    imagePath: 'assets/images/tiktok.png',
    minScore: calculateThreshold(questions.length, 0.4),
  ),

  QuizResult(
    title: 'Петро Дорошенко',
    description: 'Ти рішучий і не боїшся брати на себе відповідальність. Як Петро Дорошенко, ти готовий до боротьби, навіть якщо це складний шлях. Ти часто приймаєш рішення швидко, що робить тебе сильним лідером, але іноді ризикуєш втратити підтримку.',
    imagePath: 'assets/images/doroshenko.png',
    minScore: calculateThreshold(questions.length, 0.6),

  ),
  QuizResult(
    title: 'Пилип Орлик',
    description: 'Ти гуманіст і ідеаліст, завжди намагаєшся об\'єднати людей. Як Пилип Орлик, ти цінуєш ідеї справедливості, прав і свобод. Ти гарний дипломат, але можеш страждати через надмірну м\'якість.',
    imagePath: 'assets/images/orlyk.png',
    minScore: calculateThreshold(questions.length, 0.8),

  ),
  QuizResult(
    title: 'Данило Апостол',
    description: 'Ти мислиш новаторськи, легко адаптуєшся до нових умов. Як Данило Апостол, ти розумієш важливість реформ і готовий йти новими шляхами. Проте іноді твої ідеї можуть випереджати час.',
    imagePath: 'assets/images/apostol.png',
    minScore: calculateThreshold(questions.length, 0.9),

  ),
  
];



