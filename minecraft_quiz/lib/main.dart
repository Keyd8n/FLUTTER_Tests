import 'package:flutter/material.dart'; // Імпорт базового пакету Flutter для UI
import 'main_menu.dart'; // Імпорт файлу з головним меню

void main() {
  runApp(const MyApp()); // Запуск додатку
}

class MyApp extends StatelessWidget {
  // Головний віджет додатку
  const MyApp({super.key}); // Конструктор з необов'язковим ключем

  @override
  Widget build(BuildContext context) {
    // Метод побудови UI
    return MaterialApp(
      // Повертає матеріальний додаток
      title: 'Flutter Test', // Назва додатку
      theme: ThemeData(
        // Тема додатку
        primarySwatch: Colors.green, // Основний колір теми
      ),
      home: const MainMenu(), // Початковий екран - головне меню
    );
  }
}
