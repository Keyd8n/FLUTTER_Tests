import '../models/question.dart';
import '../models/quiz_result.dart';

final List<Question> questions = [
  Question(
    questionText: 'Як ви реагуєте на небезпечні ситуації?',
    answers: [
      Answer(text: 'Кидаюсь на допомогу не роздумуючи', score: 1),
      Answer(text: 'Спочатку аналізую ситуацію', score: 2),
      Answer(text: 'Шукаю найбезпечніший спосіб допомогти', score: 3),
      Answer(text: 'Намагаюсь покликати когось на допомогу', score: 4),
    ],
  ),
  Question(
    questionText: 'Що для вас найважливіше в житті?',
    answers: [
      Answer(text: 'Справедливість', score: 1),
      Answer(text: 'Знання та розвиток', score: 2),
      Answer(text: 'Сім\'я та друзі', score: 3),
      Answer(text: 'Особистий успіх', score: 4),
    ],
  ),
  Question(
    questionText: 'Щас би піва',
    answers: [
      Answer(text: 'З сухариками,', score: 1),
      Answer(text: 'З чіпсами і в танки', score: 2),
      Answer(text: 'Неп\'ю', score: 3),
      Answer(text: 'ДА', score: 4),
    ],
  ),
  Question(
    questionText: 'Щас би пwwва',
    answers: [
      Answer(text: 'З сухаwриками,', score: 1),
      Answer(text: 'З чіпсwами і в танки', score: 2),
      Answer(text: 'Неwп\'ю', score: 3),
      Answer(text: 'ДАw', score: 4),
    ],
  ),
  Question(
    questionText: 'Щас би пwwwва',
    answers: [
      Answer(text: 'З сухаwриками,', score: 1),
      Answer(text: 'З чіпсwами і в танки', score: 2),
      Answer(text: 'Неwп\'ю', score: 3),
      Answer(text: 'ДАw', score: 4),
    ],
  ),
  
];

// Утилітний метод для розрахунку порогу
int calculateThreshold(int totalQuestions, double percentage) {
  return (totalQuestions * 4 * percentage).round();
}

final List<QuizResult> results = [
  QuizResult(
    title: 'Ви - Супермен!',
    description: 'Ви сильна та відповідальна людина, завжди готові прийти на допомогу іншим.',
    imagePath: 'assets/images/quiz-logo.png',
    minScore: calculateThreshold(questions.length, 0.2), // 20% від максимуму
  ),
  QuizResult(
    title: 'Ви - Бетмен!',
    description: 'Ви розумні та кмітливі, покладаєтесь на технології та стратегічне мислення.',
    imagePath: 'assets/images/quiz-logo.png',
    minScore: calculateThreshold(questions.length, 0.4), // 40% від максимуму
  ),
  QuizResult(
    title: 'Ви - Людина-павук!',
    description: 'Ви веселі та дружелюбні, завжди готові пожартувати навіть у складній ситуації.',
    imagePath: 'assets/images/quiz-logo.png',
    minScore: calculateThreshold(questions.length, 0.6), // 60% від максимуму
  ),
  QuizResult(
    title: 'Ви - Супеwwwwwwрмен!',
    description: 'Ви сильна та відповідальна людина, завжди готові прийти на допомогу іншим.',
    imagePath: 'assets/images/quiz-logo.png',
    minScore: calculateThreshold(questions.length, 0.7), // 70% від максимуму
  ),
  QuizResult(
    title: 'Ви - Бетмwwwwwwен!',
    description: 'Ви розумні та кмітливі, покладаєтесь на технології та стратегічне мислення.',
    imagePath: 'assets/images/quiz-logo.png',
    minScore: calculateThreshold(questions.length, 0.8), // 80% від максимуму
  ),
  QuizResult(
    title: 'Ви - Людиwwwwwwна-павук!',
    description: 'Ви веселі та дружелюбні, завжди готові пожартувати навіть у складній ситуації.',
    imagePath: 'assets/images/quiz-logo.png',
    minScore: calculateThreshold(questions.length, 0.9), // 90% від максимуму
  ),
];