import 'dart:math';

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
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          widget.viewModel.choose(widget.card);
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.card.isMatched
                ? Colors.transparent
                : widget.card.isFacedUp
                    ? Colors.white
                    : Colors.blue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.card.isFacedUp ? Colors.black : Colors.transparent,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              widget.card.isFacedUp ? widget.card.content.toString() : '',
              style: TextStyle(
                fontSize:
                    min(constraints.maxWidth, constraints.maxHeight) * 0.8,
              ),
            ),
          ),
        ),
      );
    });
  }
}
