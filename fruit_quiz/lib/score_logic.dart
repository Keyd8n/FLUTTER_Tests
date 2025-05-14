class ScoreLogic {
  // Клас логіки підрахунку
  static Map<String, String> getResult(int score) {
    // Метод отримання результату
    // Діапазони: <=10, <=15, <=20, <=25, <=30, <=35, >35
    if (score <= 10) {
      // Якщо 10 або менше балів
      return {
        'title': 'Ти Лимон!',
        'image': 'assets/lemon.png',
        'description': 'Те, що ти лимон, означає, що ти кислий, але освіжаючий!'
      };
    } else if (score <= 15) {
      // Якщо 11-15 балів
      return {
        'title': 'Ти Яблуко!',
        'image': 'assets/apple.png',
        'description': 'Те, що ти яблуко, означає, що ти простий, але надійний!'
      };
    } else if (score <= 20) {
      // Якщо 16-20 балів
      return {
        'title': 'Ти Банан!',
        'image': 'assets/banana.png',
        'description': 'Те, що ти банан, означає, що ти веселий і енергійний!'
      };
    } else if (score <= 25) {
      // Якщо 21-25 балів
      return {
        'title': 'Ти Апельсин!',
        'image': 'assets/orange.png',
        'description':
            'Те, що ти апельсин, означає, що ти яскравий і соковитий!'
      };
    } else if (score <= 30) {
      // Якщо 26-30 балів
      return {
        'title': 'Ти Виноград!',
        'image': 'assets/grapes.png',
        'description':
            'Те, що ти виноград, означає, що ти дружелюбний і компанійський!'
      };
    } else if (score <= 35) {
      // Якщо 31-35 балів
      return {
        'title': 'Ти Ківі!',
        'image': 'assets/kiwi.png',
        'description': 'Те, що ти ківі, означає, що ти загадковий і цікавий!'
      };
    } else {
      // Якщо більше 35 балів (36-40)
      return {
        'title': 'Ти Ананас!',
        'image': 'assets/pineapple.png',
        'description':
            'Те, що ти ананас, означає, що ти унікальний і екзотичний!'
      };
    }
  }
}
