import 'dart:math';

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
    '🚊',
    '🛩',
    '🛰',
    "🦼",
    "🛴",
    "🛻",
    "⛵️",
  ];

  var newContent = emojis[Random().nextInt(emojis.length)];

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

  void restartGame() {
    model.cards!.removeWhere((card) => card.id >= 8);
    model.restart();
    notifyListeners();
  }

  void addCard() {
    if (model.cards!.length >= 27) {
      return; // Limit reached, do nothing
    }

    // Check if the new content is already present in any existing card
    while (cards!.any((card) => card.content == newContent)) {
      newContent = emojis[Random().nextInt(emojis.length)];
    }

    // Add two cards with the same content
    final newCards = [
      CardModel(content: newContent, id: cards!.length),
      CardModel(content: newContent, id: cards!.length + 1),
    ];

    model.cards!.addAll(newCards);
    model.shuffle();
    notifyListeners();
  }

  void shuffle() {
    model.shuffle();
    notifyListeners();
  }
}
