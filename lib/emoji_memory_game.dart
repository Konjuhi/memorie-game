import 'package:flutter_learn/card_model.dart';

import 'memory_game_model.dart';

class EmojiMemoryGame {
  static const emojis = [
    '🚕',
    '🚗',
    '🚒',
    '🚍',
    '🚖',
    '🚛',
    '✈️',
    '🚀',
    '🚁',
    '🛳',
    '🛸',
    '🛶',
    '🚃',
    '🛹',
    '🛼',
    '⛷',
    '🏂'
  ];

  static MemoryGame<String> createMemoryGame() {
    return MemoryGame(
      numberOfPairsOfCards: 4,
      createCardContent: (int pairIndex) => emojis[pairIndex],
    );
  }

  final MemoryGame model = EmojiMemoryGame.createMemoryGame();

  List<CardModel>? get cards {
    return model.cards;
  }

  void choose(CardModel card) {
    model.choose(card);
  }
}
