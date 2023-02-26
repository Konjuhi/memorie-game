import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/models/card_model.dart';

import '../models/memory_game_model.dart';

class MemoryGameProvider with ChangeNotifier {
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
    '🏂',
    '🏍',
    '🚉',
    '🚊'
  ];

  static MemoryGameModel<String> createMemoryGame() {
    return MemoryGameModel(
      numberOfPairsOfCards: 5,
      createCardContent: (int pairIndex) => emojis[pairIndex],
    );
  }

  final MemoryGameModel model = MemoryGameProvider.createMemoryGame();

  List<CardModel>? get cards {
    return model.cards;
  }

  void choose(CardModel card) {
    model.choose(card);
    notifyListeners();
  }
}
