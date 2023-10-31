import 'dart:math';

class Game {
  Game() {
    reset();
  }
  static final choices = ['✌️', '👊', '✋'];
  late int computer;
  GameStatus result(player) {
    if (player == 2 && computer == 1) {
      return GameStatus.won;
    } else if (player == 1 && computer == 0) {
      return GameStatus.won;
    } else if (player == 0 && computer == 2) {
      return GameStatus.won;
    } else if (player == computer) {
      return GameStatus.tied;
    }
    return GameStatus.lost;
  }

  void reset() {
    computer = Random().nextInt(3);
  }
}

enum GameStatus { won, lost, tied, ongoing }
