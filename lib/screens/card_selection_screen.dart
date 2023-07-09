import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/memory_game_provider.dart';
import '../widgets/custom_drop_down_button.dart';
import '../widgets/dismiss_keyboard_widget.dart';
import 'memory_game_screen.dart';

class CardSelectionScreen extends StatefulWidget {
  const CardSelectionScreen({Key? key}) : super(key: key);

  @override
  CardSelectionScreenState createState() => CardSelectionScreenState();
}

class CardSelectionScreenState extends State<CardSelectionScreen> {
  int selectedCardCount = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select Number of Cards:'),
            const SizedBox(height: 10),
            CustomDropdownButton(
              value: selectedCardCount,
              onChanged: (value) {
                setState(() {
                  selectedCardCount = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final MemoryGameProvider viewModel = MemoryGameProvider(
                  numberOfPairsOfCards: selectedCardCount ~/ 2,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => viewModel,
                      child: const DismissKeyboard(
                        child: MemoryGameScreen(),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
