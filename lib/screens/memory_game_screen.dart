import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  final isIOS = Platform.isIOS ? true : false;

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
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!viewModel.isPaused) {
          setState(
            () {
              if (viewModel.hasWon) {
                _timer.cancel();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (dialogContext) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: AlertDialog(
                        title: const Text('Your Result'),
                        content: Text(
                          'You matched all ${viewModel.matchedPairs} pairs in second of $_timeLeft',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              viewModel.restartGame();
                              setState(
                                () {
                                  _timeLeft = int.parse(
                                      "30"); // Set to the initial value
                                },
                              );
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
              } else if (_timeLeft > 0) {
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
                            Text('You matched ${viewModel.matchedPairs} pairs'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              viewModel.restartGame();
                              setState(() {
                                _timeLeft =
                                    int.parse("30"); // Set to the initial value
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
            },
          );
        }
      },
    );
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
                  'Time Left: ${Duration(seconds: _timeLeft).inMinutes}:${(Duration(seconds: _timeLeft).inSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 20),
                isIOS
                    ? ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext builderContext) {
                              return SizedBox(
                                height: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .height /
                                    3,
                                child: CupertinoTimerPicker(
                                  mode: CupertinoTimerPickerMode.ms,
                                  initialTimerDuration:
                                      Duration(seconds: _timeLeft),
                                  onTimerDurationChanged:
                                      (Duration newDuration) {
                                    setState(() {
                                      _timeLeft = newDuration.inSeconds;
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Select Time',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          int selectedMinute = 0;
                          int selectedSecond = 0;

                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Select Time'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('Minutes'),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: DropdownButtonFormField<int>(
                                            value: selectedMinute,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  selectedMinute = value!;
                                                },
                                              );
                                            },
                                            items: List.generate(
                                              60,
                                              (index) {
                                                return DropdownMenuItem(
                                                  value: index,
                                                  child: Text(index.toString()),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Text('Seconds'),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: DropdownButtonFormField<int>(
                                            value: selectedSecond,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  selectedSecond = value!;
                                                },
                                              );
                                            },
                                            items: List.generate(60, (index) {
                                              return DropdownMenuItem(
                                                value: index,
                                                child: Text(index.toString()),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('CANCEL'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      int totalSeconds =
                                          selectedMinute * 60 + selectedSecond;
                                      setState(() {
                                        _timeLeft = totalSeconds;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Select Time',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      ),
                const SizedBox(height: 20),
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
                            if (viewModel.isPaused) {
                              startTimer(context);
                            } else {
                              _timer.cancel();
                            }
                            setState(
                              () {
                                viewModel.isPaused = !viewModel.isPaused;
                              },
                            );
                          },
                          child: FittedBox(
                            child: Text(
                              viewModel.isPaused ? 'Resume' : 'Pause',
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
