import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../provider/memory_game_provider.dart';

class MemoryGameWidget extends StatefulWidget {
  final CardModel card;
  final MemoryGameProvider viewModel;

  const MemoryGameWidget(
      {super.key, required this.card, required this.viewModel});

  @override
  State<MemoryGameWidget> createState() => _MemoryGameWidgetState();
}

class _MemoryGameWidgetState extends State<MemoryGameWidget> {
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
          color: widget.card.isFacedUp
              ? Colors.white
              : widget.card.isMatched // updated line
                  ? Colors.white
                  : Colors.red,
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
