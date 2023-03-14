import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/aspect_ratio_widget.dart';
import 'package:provider/provider.dart';

import '../provider/memory_game_provider.dart';
import '../widgets/memory_game_widget.dart';

class MemoryGameScreen extends StatefulWidget {
  const MemoryGameScreen({
    super.key,
  });

  @override
  State<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MemoryGameProvider>().shuffle();
    });
    super.initState();
  }

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.shuffle();
                          },
                          child: const Text(
                            'Shuffle',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.addCard();
                          },
                          child: const FittedBox(
                            child: Text(
                              'Add Card',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.restartGame();
                          },
                          child: const Text(
                            'Restart',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
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
