import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/screens/welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissor',
      home: const WelcomeScreen(),
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
    );
  }
}

void main(List<String> args) {
  runApp(const App());
}
