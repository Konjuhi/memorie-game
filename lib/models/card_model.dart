class CardModel<CardContent> {
  bool isFacedUp;
  bool? isMatched;
  CardContent? content;
  int id;

  CardModel({
    this.isFacedUp = true,
    this.isMatched,
    this.content,
    required this.id,
  });
}
