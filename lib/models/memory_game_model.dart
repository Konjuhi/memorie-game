import 'package:flutter_learn/models/card_model.dart';

extension ListExtension<T> on List<T> {
  T? get oneAndOnly {
    if (length == 1) {
      return this[0];
    } else {
      return null;
    }
  }
}

class MemoryGameModel<CardContent> {
  List<CardModel>? cards;

  MemoryGameModel({
    required int numberOfPairsOfCards,
    required Function(int) createCardContent,
  }) : cards = [] {
    for (var pairIndex = 0; pairIndex < numberOfPairsOfCards; pairIndex++) {
      final content = createCardContent(pairIndex);
      cards?.add(CardModel(content: content, id: pairIndex * 2));
      cards?.add(CardModel(content: content, id: pairIndex * 2 + 1));
    }
  }

  int? get getIndexOfTheOneAndOnlyFacedUpCard {
    final facedUpCards = cards!.where((card) => card.isFacedUp).toList();
    return facedUpCards.oneAndOnly != null
        ? cards!.indexOf(facedUpCards.oneAndOnly!)
        : null;
  }

  set setIndexOfTheOneAndOnlyFacedUpCard(int? newValue) {
    for (var card in cards!) {
      card.isFacedUp = cards!.indexOf(card) == newValue;
    }
  }

  void choose(CardModel card) {
    final chosenIndex = cards!.indexWhere((c) => c.id == card.id);
    if (chosenIndex != -1 &&
        !cards![chosenIndex].isFacedUp &&
        !cards![chosenIndex].isMatched) {
      if (getIndexOfTheOneAndOnlyFacedUpCard != null) {
        final potentialMatchIndex = getIndexOfTheOneAndOnlyFacedUpCard!;
        if (cards![chosenIndex].content ==
            cards![potentialMatchIndex].content) {
          cards![chosenIndex].isMatched = true;
          cards![potentialMatchIndex].isMatched = true;
        }
        cards![chosenIndex].isFacedUp = true;
      } else {
        setIndexOfTheOneAndOnlyFacedUpCard = chosenIndex;
      }
    }
  }
}
