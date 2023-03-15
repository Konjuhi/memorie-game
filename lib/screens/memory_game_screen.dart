import 'dart:async';

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
  int _timeLeft = 30;
  late Timer _timer;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MemoryGameProvider>().shuffle();
      startTimer(context);
    });
  }

  void startTimer(BuildContext context) {
    var viewModel = Provider.of<MemoryGameProvider>(context, listen: false);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          if (_timeLeft > 0) {
            _timeLeft--;
          } else {
            _timer.cancel();
            // Game Over
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: AlertDialog(
                    title: const Text('Your Result'),
                    content:
                        Text('You matched ${viewModel.matchedPairs} pairs!'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          viewModel.restartGame();
                          setState(() {
                            _timeLeft = 30;
                          });
                          startTimer(context);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Restart'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                Text(
                  'Time Left: $_timeLeft',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            if (_isPaused) {
                              // Resume the timer
                              startTimer(context);
                            } else {
                              // Pause the timer
                              _timer.cancel();
                            }
                            setState(() {
                              _isPaused = !_isPaused;
                            });
                          },
                          child: FittedBox(
                            child: Text(
                              _isPaused ? 'Resume' : 'Pause',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.restartGame();
                            setState(() {
                              _timeLeft = 30;
                            });
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
