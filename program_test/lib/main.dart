import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Тест: Яка ти мова програмування?',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const StartScreen(),
    );
  }
}
