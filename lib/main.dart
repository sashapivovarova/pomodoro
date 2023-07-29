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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xfff88987),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xff4b2238),
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
