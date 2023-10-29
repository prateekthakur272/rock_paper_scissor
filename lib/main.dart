import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissor',
      home: const Placeholder(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

void main(List<String> args) {
  runApp(const App());
}
