import 'package:flutter_learn/models/card_model.dart';

class MemoryGameModel<CardContent> {
  List<CardModel>? cards;

  MemoryGameModel(
      {this.cards,
      required int numberOfPairsOfCards,
      required CardContent? Function(int)? createCardContent}) {
    cards = <CardModel>[];

    for (var pairIndex = 0; pairIndex < numberOfPairsOfCards; pairIndex++) {
      final content = createCardContent!(pairIndex);
      cards!.add(CardModel(content: content, id: pairIndex * 2));
      cards!.add(CardModel(content: content, id: pairIndex * 2 + 1));
    }
  }

  void choose(CardModel card) {
    final chosenIndex = index(card);
    var chosenCard = cards![chosenIndex];
    chosenCard.isFacedUp = !chosenCard.isFacedUp;
  }

  int index(CardModel card) {
    for (var i = 0; i < cards!.length; i++) {
      if (cards![i].id == card.id) {
        return i;
      }
    }
    return 0; // bogus!
  }
}
