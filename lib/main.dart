import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xfff8887e),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xffe0acce),
          ),
        ),
        cardColor: const Color(
          0xfff4eddb,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
