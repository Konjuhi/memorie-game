import 'dart:math';

import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../provider/memory_game_provider.dart';

class MemoryGameWidget extends StatelessWidget {
  final CardModel card;
  final MemoryGameProvider viewModel;

  const MemoryGameWidget({
    Key? key,
    required this.card,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            viewModel.choose(card);
          },
          child: Container(
            decoration: BoxDecoration(
              color: card.isMatched
                  ? Colors.transparent
                  : card.isFacedUp
                      ? Colors.white
                      : Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: card.isFacedUp
                    ? Colors.blue.withOpacity(0.5)
                    : Colors.transparent,
                width: 3,
              ),
            ),
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      card.isFacedUp ? card.content.toString() : '',
                      style: TextStyle(
                        fontSize:
                            min(constraints.maxWidth, constraints.maxHeight) *
                                0.8,
                      ),
                    ),
                  ),
                  if (card.isFacedUp && card.isMatched)
                    Icon(
                      Icons.check_circle,
                      color: Colors.red,
                      size: min(constraints.maxWidth, constraints.maxHeight) *
                          0.5,
                    ),
                  // if (card.isFacedUp)
                  //   CustomPaint(
                  //     size: Size(constraints.maxWidth, constraints.maxHeight),
                  //     painter:
                  //         PieWidget(startAngle: 0 - 90, endAngle: 110 - 20),
                  //   )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
