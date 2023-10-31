import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/game.dart';

class GameplayScreen extends StatefulWidget {
  const GameplayScreen({super.key});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  int player = 0;
  bool show = false;
  get child => null;
  final game = Game();
  final ValueNotifier winner = ValueNotifier<GameStatus>(GameStatus.ongoing);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rock Paper Scissor'),
        ),
        body: Center(
            child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Text(
                          show ? Game.choices[game.computer] : '💻',
                          style: const TextStyle(fontSize: 72),
                        ),
                        const Text(
                          'Computer',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ValueListenableBuilder(
                      valueListenable: winner,
                      builder: (context, value, _) {
                        if (value == GameStatus.won) {
                          return Column(
                            children: [
                              const Text(
                                'You won the game',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      show = false;
                                      winner.value = GameStatus.ongoing;
                                      game.reset();
                                    });
                                  },
                                  child: const Text('Reset Game'))
                            ],
                          );
                        } else if (value == GameStatus.lost) {
                          return Column(
                            children: [
                              const Text(
                                'You lost the game',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      show = false;
                                      winner.value = GameStatus.ongoing;
                                      game.reset();
                                    });
                                  },
                                  child: const Text('Reset Game'))
                            ],
                          );
                        } else if (value == GameStatus.tied) {
                          return Column(
                            children: [
                              const Text(
                                'Game Tied, No one wins',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      show = false;
                                      winner.value = GameStatus.ongoing;
                                      game.reset();
                                    });
                                  },
                                  child: const Text('Reset Game'))
                            ],
                          );
                        }
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: !show
                                  ? () {
                                      setState(() {
                                        player = 0;
                                        show = true;
                                      });
                                      winner.value = game.result(player);
                                    }
                                  : null,
                              icon: const Text(
                                '✌️',
                                style: TextStyle(fontSize: 56),
                              ),
                              iconSize: 54,
                            ),
                            IconButton(
                              onPressed: !show
                                  ? () {
                                      setState(() {
                                        player = 1;
                                        show = true;
                                      });
                                      winner.value = game.result(player);
                                    }
                                  : null,
                              icon: const Text(
                                '👊',
                                style: TextStyle(fontSize: 56),
                              ),
                              iconSize: 54,
                            ),
                            IconButton(
                              onPressed: !show
                                  ? () {
                                      setState(() {
                                        player = 2;
                                        show = true;
                                      });
                                      winner.value = game.result(player);
                                    }
                                  : null,
                              icon: const Text(
                                '✋',
                                style: TextStyle(fontSize: 56),
                              ),
                              iconSize: 54,
                            ),
                          ],
                        );
                      })),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 160,
                    width: 160,
                    child: Column(
                      children: [
                        Text(
                          show ? Game.choices[player] : '👨‍💻',
                          style: const TextStyle(fontSize: 72),
                        ),
                        const Text(
                          'Player',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        )));
  }
}
