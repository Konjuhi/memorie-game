import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/aspect_ratio_widget.dart';
import 'package:provider/provider.dart';

import '../provider/memory_game_provider.dart';
import '../widgets/memory_game_widget.dart';

class MemoryGameScreen extends StatelessWidget {
  const MemoryGameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoryGameProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              children: [
                Expanded(
                  child: AspectRatioWidget(
                    items: viewModel.cards!,
                    aspectRatio: 2 / 3,
                    content: (card) {
                      if (card.isMatched && !card.isFacedUp) {
                        return const Opacity(opacity: 0);
                      } else {
                        return MemoryGameWidget(
                          card: card,
                          viewModel: viewModel,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
