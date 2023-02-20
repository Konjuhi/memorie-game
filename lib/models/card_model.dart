class CardModel<CardContent> {
  bool isFacedUp;
  bool isMatched;
  CardContent? content;
  int id;

  CardModel({
    this.isFacedUp = false,
    this.isMatched = false,
    this.content,
    required this.id,
  });
}
