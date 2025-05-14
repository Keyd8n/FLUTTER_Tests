class ScoreLogic {
  // Клас логіки підрахунку
  static Map<String, String> getResult(int score) {
    // Метод отримання результату
    // Діапазони: <=10, <=15, <=20, <=25, <=30, <=35, >35
    if (score <= 10) {
      // Якщо 10 або менше балів
      return {
        'title': 'Ти Морква!',
        'image': 'assets/lemon.png',
        'description': 'Те, що ти морква, означає, що ти гіркий, але освіжаючий!'
      };
    } else if (score <= 15) {
      // Якщо 11-15 балів
      return {
        'title': 'Ти Березові дошки!',
        'image': 'assets/apple.png',
        'description': 'Те, що ти березові дошки, означає, що ти простий, але надійний!'
      };
    } else if (score <= 20) {
      // Якщо 16-20 балів
      return {
        'title': 'Ти Верстак!',
        'image': 'assets/banana.png',
        'description': 'Те, що ти верстак, означає, що ти веселий і енергійний!'
      };
    } else if (score <= 25) {
      // Якщо 21-25 балів
      return {
        'title': 'Ти Блок землі!',
        'image': 'assets/orange.png',
        'description':
            'Те, що ти блок землі, означає, що ти простий, але надійний!'
      };
    } else if (score <= 30) {
      // Якщо 26-30 балів
      return {
        'title': 'Ти Блок залізної руди!',
        'image': 'assets/grapes.png',
        'description':
            'Те, що ти блок залізної руди, означає, що ти дружелюбний і компанійський!'
      };
    } else if (score <= 35) {
      // Якщо 31-35 балів
      return {
        'title': 'Ти Смарагдовий блок!',
        'image': 'assets/kiwi.png',
        'description': 'Те, що ти смарагдовий блок, означає, що ти загадковий і цікавий!'
      };
    } else {
      // Якщо більше 35 балів (36-40)
      return {
        'title': 'Ти Морський ліхтарик!',
        'image': 'assets/pineapple.png',
        'description':
            'Те, що ти морський ліхтарик, означає, що ти унікальний і екзотичний!'
      };
    }
  }
}
