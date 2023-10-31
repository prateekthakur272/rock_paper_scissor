import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/screens/gameplay_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissor'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/icon.png',
                height: 200,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameplayScreen()));
                  },
                  icon: const Icon(Icons.computer),
                  label: const Text('Play With Computer')),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        showDragHandle: true,
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SizedBox(
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Instructions',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        '✌️ wins ✋',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const Text(
                                        '✋ wins 👊',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const Text(
                                        '👊 wins ✌️',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Back To Home')),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: const Text('How To Play?'))
            ],
          ),
        ),
      ),
    );
  }
}
