import '../models/question.dart';
import '../models/quiz_result.dart';

final List<Question> questions = [
  Question(
    questionText: 'Як ти реагуєш, коли хтось сумнівається у твоїх силах?',
    answers: [
      Answer(text: 'Доводжу на ділі, хто я є', score: 4),
      Answer(text: 'Спокійно пояснюю свою позицію', score: 3),
      Answer(text: 'Ігнорую – мені це не важливо', score: 2),
      Answer(text: 'Мене це ранить, але мовчу', score: 1),
    ],
  ),
  Question(
    questionText: 'Що для тебе є джерелом сили?',
    answers: [
      Answer(text: 'Внутрішній спокій', score: 3),
      Answer(text: 'Моя воля та характер', score: 4),
      Answer(text: 'Підтримка близьких', score: 2),
      Answer(text: 'Зовнішнє визнання', score: 1),
    ],
  ),
  Question(
    questionText: 'Тобі треба зробити важке рішення. Як ти дієш?',
    answers: [
      Answer(text: 'Шукаю максимум інформації', score: 3),
      Answer(text: 'Роблю по відчуттю — я довіряю собі', score: 4),
      Answer(text: 'Раджуся з кимось досвідченим', score: 2),
      Answer(text: 'Відкладаю, поки не стане легше', score: 1),
    ],
  ),
  Question(
    questionText: 'Що ти думаєш про силу?',
    answers: [
      Answer(text: 'Це контроль над собою і ситуацією', score: 4),
      Answer(text: 'Це витривалість і розум', score: 3),
      Answer(text: 'Це вміння бути добрим', score: 2),
      Answer(text: 'Це щось, що мають лише обрані', score: 1),
    ],
  ),
  Question(
    questionText: 'Який ти в конфлікті?',
    answers: [
      Answer(text: 'Вирішую без емоцій, твердо', score: 4),
      Answer(text: 'Намагаюсь зрозуміти обидві сторони', score: 3),
      Answer(text: 'Виходжу з ситуації, уникаючи ескалації', score: 2),
      Answer(text: 'Підлаштовуюсь, щоб уникнути проблем', score: 1),
    ],
  ),
];



// Утилітний метод для розрахунку порогу
int calculateThreshold(int totalQuestions, double percentage) {
  return (totalQuestions * 4 * percentage).round();
}

final List<QuizResult> results = [
  QuizResult(
    title: 'Ти – Потужний Титан!',
    description: 'Твоя сила – у впевненості, рішучості та вмінні залишатися собою за будь-яких обставин. Ти не просто потужний – ти лідер.',
    imagePath: 'assets/images/titan.png',
    minScore: calculateThreshold(questions.length, 0.2),
  ),
  QuizResult(
    title: 'Ти – Стійкий Лідер',
    description: 'Ти маєш силу волі, витримку та гнучкий розум. У кризі ти зберігаєш холодну голову й ведеш за собою інших.',
    imagePath: 'assets/images/leader.png',
    minScore: calculateThreshold(questions.length, 0.4),

  ),
  QuizResult(
    title: 'Ти – Прихована Сила',
    description: 'Твоя потужність не завжди помітна, але вона є. Ти можеш здивувати, коли настане твій момент.',
    imagePath: 'assets/images/quiet.png',
    minScore: calculateThreshold(questions.length, 0.6),

  ),
  QuizResult(
    title: 'Ти – Сила в процесі',
    description: 'Ти ще на шляху до повної впевненості. У тобі є іскра – лиш варто її розпалити.',
    imagePath: 'assets/images/inprogress.png',
    minScore: calculateThreshold(questions.length, 0.8),

  ),
];


