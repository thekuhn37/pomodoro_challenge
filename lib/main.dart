import 'package:flutter/material.dart';
import 'package:pomodoro_challenge/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(230, 77, 61, 1),
            background: const Color.fromRGBO(200, 76, 74, 1),
            onBackground: const Color.fromRGBO(234, 228, 196, 1),
            secondary: const Color.fromRGBO(58, 122, 121, 1),
            inversePrimary: const Color.fromRGBO(58, 122, 121, 1),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFFC84C4A),
              fontSize: 70,
            ),
            displayMedium: TextStyle(
              fontSize: 20,
            ),
            displaySmall: TextStyle(
              fontSize: 16,
            ),
          ),
          cardColor: const Color.fromRGBO(255, 255, 255, 1)),
      home: const HomeScreen(),
    );
  }
}
