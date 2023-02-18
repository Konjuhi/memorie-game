import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_model.dart';
import 'emoji_memory_game.dart';

class ContentView extends StatelessWidget {
  const ContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EmojiMemoryGame>(builder: (context, viewModel, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CardView(
                      card: viewModel.cards![index],
                      viewModel: viewModel,
                    );
                  },
                  itemCount: viewModel.cards?.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class CardView extends StatefulWidget {
  final CardModel card;
  final EmojiMemoryGame viewModel;

  const CardView({super.key, required this.card, required this.viewModel});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print("Kliko: ${widget.card.isFacedUp}");
        }
        widget.viewModel.choose(widget.card);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.card.isFacedUp ? Colors.white : Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.card.isFacedUp ? widget.card.content : '',
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
